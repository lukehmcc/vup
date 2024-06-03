import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:filesystem_dac/dac.dart';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:vup/app.dart';
import 'package:vup/model/sync_task.dart';
import 'package:file_selector/file_selector.dart' as file_selector;

import 'base.dart';

class UploadDirectoryVupAction extends VupFSAction {
  @override
  VupFSActionInstance? check(
      bool isFile,
      dynamic entity,
      PathNotifierState pathNotifier,
      BuildContext context,
      bool isDirectoryView,
      bool hasWriteAccess,
      FileState fileState,
      bool isSelected) {
    if (!isDirectoryView) return null;
    if (!hasWriteAccess) return null;

    return VupFSActionInstance(
      label: 'Upload Directory',
      icon: UniconsLine.folder_upload,
    );
  }

  @override
  Future execute(
    BuildContext context,
    VupFSActionInstance instance,
  ) async {
    late final String? directoryPath;

    if (Platform.isAndroid || Platform.isIOS) {
      directoryPath = await FilePicker.platform.getDirectoryPath();
    } else {
      directoryPath = await file_selector.getDirectoryPath();
    }

    final currentUri = instance.pathNotifier.toCleanUri().toString();

    if (directoryPath != null) {
      final name = basename(directoryPath);
      final di = storageService.dac.getDirectoryMetadataCached(currentUri)!;
      if (!di.directories.containsKey(name)) {
        await storageService.dac.createDirectory(
          currentUri,
          name,
        );
      }

      await storageService.startSyncTask(
        Directory(directoryPath),
        (instance.pathNotifier.path + [name]).join('/'),
        SyncMode.sendOnly,
        syncKey: const Uuid().v4(),
      );
    }
  }
}
