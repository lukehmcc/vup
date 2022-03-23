import 'dart:async';
import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:filesize/filesize.dart';
import 'package:intl/intl.dart';
import 'package:vup/generic/state.dart';
import 'package:vup/service/base.dart';
import 'package:vup/service/web_server/serve_chunked_file.dart';

class WebServerService extends VupService {
  bool isRunning = false;
  late Alfred app;

  void stop() {
    info('stopping server...');
    app.close(force: true);
    isRunning = false;
    info('stopped server.');
  }

  void start(int port, String bindIp) {
    if (isRunning) return;
    isRunning = true;

    info('starting server...');

    app = Alfred();

    Map<String, Completer<String>> downloadCompleters = {};

    Map<String, String> getHeadersForFile(DirectoryFile file) {
      final df = DateFormat('EEE, dd MMM yyyy HH:mm:ss');
      final dt = DateTime.fromMillisecondsSinceEpoch(file.modified).toUtc();
      return {
        'Accept-Ranges': 'bytes',
        'Content-Length': file.file.size.toString(),
        'Content-Type': file.mimeType ?? 'application/octet-stream',
        'Etag': '"${file.file.hash}"',
        'Last-Modified': df.format(dt) + ' GMT',
      };
    }

    app.get('*', (req, res) async {
      final path = Uri.decodeComponent(
        req.requestedUri.path,
      );

      if (path.endsWith('/')) {
        final di = /* storageService.dac.getDirectoryIndexCached(
              path,
            ) ?? */
            (await storageService.dac.getDirectoryIndex(
          path,
        ));
        /*  var html = "";
        for (final dir in dirIndex.directories.keys) {
          html += '<a href="./${Uri.encodeComponent(dir)}/">${dir}/</a><br/>';
        }
        for (final file in dirIndex.files.keys) {
          html += '<a href="./${Uri.encodeComponent(file)}">$file</a><br/>';
        }
        // res.headers.set('Last-Modified', ); */
        final title = 'Index of $path';

        var html = '''<html><head><title>$title</title></head>
<body bgcolor="white">
<h1>$title</h1><hr><pre><a href="../">../</a>
''';
        int maxLength = 0;

        for (final dynamic item in [
          ...di.directories.values,
          ...di.files.values
        ]) {
          if (item.name.length > maxLength) {
            maxLength = item.name.length;
          }
        }
        maxLength += 3;

        String doPadding(int length) {
          return List.generate(length, (index) => ' ').join();
        }

        String formatDate(int ts) {
          final dt = DateTime.fromMillisecondsSinceEpoch(ts);
          return dt.toIso8601String().replaceFirst('T', ' ').substring(0, 16);
        }

        final dirs = di.directories.values.toList();
        dirs.sort((a, b) => a.name.compareTo(b.name));
        for (final dir in dirs) {
          html +=
              '<a href="./${Uri.encodeComponent(dir.key!)}/">${dir.name}/</a>${doPadding(maxLength - dir.name.length - 1)}${formatDate(dir.created)}${doPadding(11)}-<br/>';
        }
        final files = di.files.values.toList();
        files.sort((a, b) => a.name.compareTo(b.name));

        for (final file in files) {
          final size = filesize(file.file.size);

          html +=
              '<a href="./${Uri.encodeComponent(file.key!)}">${file.name}</a>${doPadding(maxLength - file.name.length)}${formatDate(file.created)}${doPadding(12 - size.length)}${size}<br/>';
        }

        html += '''</pre><hr>

</body></html>''';

        res.headers.contentType = ContentType.html;
        return html;
      } else {
        final parsed = storageService.dac.parseFilePath(path);

        final dirIndex = storageService.dac.getDirectoryIndexCached(
          parsed.directoryPath,
        )!;

        final file = dirIndex.files[parsed.fileName];
        if (file == null) {
          res.statusCode = HttpStatus.notFound;
          return '';
        }

        for (final e in getHeadersForFile(file).entries) {
          res.headers.set(e.key, e.value);
        }

        final localFile = storageService.getLocalFile(file);
        if (localFile != null) return localFile;

        if (file.file.encryptionType == 'libsodium_secretbox') {
          await handleChunkedFile(req, res, file, file.file.size);
          return null;
        }

        if (downloadCompleters.containsKey(file.file.hash)) {
          if (!downloadCompleters[file.file.hash]!.isCompleted) {
            return File(await downloadCompleters[file.file.hash]!.future);
          }
        } else {
          downloadCompleters[file.file.hash] = Completer<String>();
        }
        final link = await downloadPool.withResource(
          () => storageService.downloadAndDecryptFile(
            fileData: file.file,
            name: file.name,
            outFile: null,
          ),
        );
        if (!downloadCompleters[file.file.hash]!.isCompleted) {
          downloadCompleters[file.file.hash]!.complete(link);
        }
        return File(link);
      }
    });

    app.head('*', (req, res) async {
      final path = Uri.decodeFull(req.requestedUri.path);
      if (path.endsWith('/')) {
      } else {
        final parsed = storageService.dac.parseFilePath(path);

        final dirIndex = storageService.dac.getDirectoryIndexCached(
          parsed.directoryPath,
        )!;

        final file = dirIndex.files[parsed.fileName];
        if (file == null) {
          res.statusCode = HttpStatus.notFound;
          return null;
        }

        for (final e in getHeadersForFile(file).entries) {
          res.headers.set(e.key, e.value);
        }

        return '';
      }
    });

    info('server is running at $bindIp:$port');

    app.listen(port, bindIp);
  }
}
