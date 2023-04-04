// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.62.0.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member

import "bridge_definitions.dart";
import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';

import 'dart:ffi' as ffi;

import 'package:s5_server/rust/bridge_definitions.dart' as s5_server;

class RustImpl implements Rust {
  final RustPlatform _platform;
  factory RustImpl(ExternalLibrary dylib) => RustImpl.raw(RustPlatform(dylib));

  /// Only valid on web/WASM platforms.
  factory RustImpl.wasm(FutureOr<WasmModule> module) =>
      RustImpl(module as ExternalLibrary);
  RustImpl.raw(this._platform);
  Future<Uint8List> encryptFileXchacha20(
      {required String inputFilePath,
      required String outputFilePath,
      required int padding,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(inputFilePath);
    var arg1 = _platform.api2wire_String(outputFilePath);
    var arg2 = api2wire_usize(padding);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_encrypt_file_xchacha20(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kEncryptFileXchacha20ConstMeta,
      argValues: [inputFilePath, outputFilePath, padding],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEncryptFileXchacha20ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "encrypt_file_xchacha20",
        argNames: ["inputFilePath", "outputFilePath", "padding"],
      );

  Future<int> decryptFileXchacha20(
      {required String inputFilePath,
      required String outputFilePath,
      required Uint8List key,
      required int padding,
      required int lastChunkIndex,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(inputFilePath);
    var arg1 = _platform.api2wire_String(outputFilePath);
    var arg2 = _platform.api2wire_uint_8_list(key);
    var arg3 = api2wire_usize(padding);
    var arg4 = api2wire_u32(lastChunkIndex);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_decrypt_file_xchacha20(port_, arg0, arg1, arg2, arg3, arg4),
      parseSuccessData: _wire2api_u8,
      constMeta: kDecryptFileXchacha20ConstMeta,
      argValues: [inputFilePath, outputFilePath, key, padding, lastChunkIndex],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDecryptFileXchacha20ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "decrypt_file_xchacha20",
        argNames: [
          "inputFilePath",
          "outputFilePath",
          "key",
          "padding",
          "lastChunkIndex"
        ],
      );

  Future<ThumbnailResponse> generateThumbnailForImageFile(
      {required String imageType,
      required String path,
      required int exifImageOrientation,
      dynamic hint}) {
    var arg0 = _platform.api2wire_String(imageType);
    var arg1 = _platform.api2wire_String(path);
    var arg2 = api2wire_u8(exifImageOrientation);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_generate_thumbnail_for_image_file(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_thumbnail_response,
      constMeta: kGenerateThumbnailForImageFileConstMeta,
      argValues: [imageType, path, exifImageOrientation],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kGenerateThumbnailForImageFileConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "generate_thumbnail_for_image_file",
        argNames: ["imageType", "path", "exifImageOrientation"],
      );

  Future<Uint8List> encryptXchacha20Poly1305(
      {required Uint8List key,
      required Uint8List nonce,
      required Uint8List plaintext,
      dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(key);
    var arg1 = _platform.api2wire_uint_8_list(nonce);
    var arg2 = _platform.api2wire_uint_8_list(plaintext);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_encrypt_xchacha20poly1305(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kEncryptXchacha20Poly1305ConstMeta,
      argValues: [key, nonce, plaintext],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kEncryptXchacha20Poly1305ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "encrypt_xchacha20poly1305",
        argNames: ["key", "nonce", "plaintext"],
      );

  Future<Uint8List> decryptXchacha20Poly1305(
      {required Uint8List key,
      required Uint8List nonce,
      required Uint8List ciphertext,
      dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(key);
    var arg1 = _platform.api2wire_uint_8_list(nonce);
    var arg2 = _platform.api2wire_uint_8_list(ciphertext);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner
          .wire_decrypt_xchacha20poly1305(port_, arg0, arg1, arg2),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kDecryptXchacha20Poly1305ConstMeta,
      argValues: [key, nonce, ciphertext],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kDecryptXchacha20Poly1305ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "decrypt_xchacha20poly1305",
        argNames: ["key", "nonce", "ciphertext"],
      );

  Future<Uint8List> hashBlake3File({required String path, dynamic hint}) {
    var arg0 = _platform.api2wire_String(path);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_hash_blake3_file(port_, arg0),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kHashBlake3FileConstMeta,
      argValues: [path],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kHashBlake3FileConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "hash_blake3_file",
        argNames: ["path"],
      );

  Future<Uint8List> hashBlake3({required Uint8List input, dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(input);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_hash_blake3(port_, arg0),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kHashBlake3ConstMeta,
      argValues: [input],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kHashBlake3ConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "hash_blake3",
        argNames: ["input"],
      );

  Uint8List hashBlake3Sync({required Uint8List input, dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(input);
    return _platform.executeSync(FlutterRustBridgeSyncTask(
      callFfi: () => _platform.inner.wire_hash_blake3_sync(arg0),
      parseSuccessData: _wire2api_uint_8_list,
      constMeta: kHashBlake3SyncConstMeta,
      argValues: [input],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kHashBlake3SyncConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "hash_blake3_sync",
        argNames: ["input"],
      );

  Future<int> verifyIntegrity(
      {required Uint8List chunkBytes,
      required int offset,
      required Uint8List baoOutboardBytes,
      required Uint8List blake3Hash,
      dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(chunkBytes);
    var arg1 = _platform.api2wire_u64(offset);
    var arg2 = _platform.api2wire_uint_8_list(baoOutboardBytes);
    var arg3 = _platform.api2wire_uint_8_list(blake3Hash);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) =>
          _platform.inner.wire_verify_integrity(port_, arg0, arg1, arg2, arg3),
      parseSuccessData: _wire2api_u8,
      constMeta: kVerifyIntegrityConstMeta,
      argValues: [chunkBytes, offset, baoOutboardBytes, blake3Hash],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kVerifyIntegrityConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "verify_integrity",
        argNames: ["chunkBytes", "offset", "baoOutboardBytes", "blake3Hash"],
      );

  Future<s5_server.BaoResult> hashBaoFile(
      {required String path, dynamic hint}) {
    var arg0 = _platform.api2wire_String(path);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_hash_bao_file(port_, arg0),
      parseSuccessData: _wire2api_bao_result,
      constMeta: kHashBaoFileConstMeta,
      argValues: [path],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kHashBaoFileConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "hash_bao_file",
        argNames: ["path"],
      );

  Future<s5_server.BaoResult> hashBaoMemory(
      {required Uint8List bytes, dynamic hint}) {
    var arg0 = _platform.api2wire_uint_8_list(bytes);
    return _platform.executeNormal(FlutterRustBridgeTask(
      callFfi: (port_) => _platform.inner.wire_hash_bao_memory(port_, arg0),
      parseSuccessData: _wire2api_bao_result,
      constMeta: kHashBaoMemoryConstMeta,
      argValues: [bytes],
      hint: hint,
    ));
  }

  FlutterRustBridgeTaskConstMeta get kHashBaoMemoryConstMeta =>
      const FlutterRustBridgeTaskConstMeta(
        debugName: "hash_bao_memory",
        argNames: ["bytes"],
      );

  void dispose() {
    _platform.dispose();
  }
// Section: wire2api

  s5_server.BaoResult _wire2api_bao_result(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 2)
      throw Exception('unexpected arr length: expect 2 but see ${arr.length}');
    return s5_server.BaoResult(
      hash: _wire2api_uint_8_list(arr[0]),
      outboard: _wire2api_uint_8_list(arr[1]),
    );
  }

  ThumbnailResponse _wire2api_thumbnail_response(dynamic raw) {
    final arr = raw as List<dynamic>;
    if (arr.length != 4)
      throw Exception('unexpected arr length: expect 4 but see ${arr.length}');
    return ThumbnailResponse(
      bytes: _wire2api_uint_8_list(arr[0]),
      thumbhashBytes: _wire2api_uint_8_list(arr[1]),
      width: _wire2api_u32(arr[2]),
      height: _wire2api_u32(arr[3]),
    );
  }

  int _wire2api_u32(dynamic raw) {
    return raw as int;
  }

  int _wire2api_u8(dynamic raw) {
    return raw as int;
  }

  Uint8List _wire2api_uint_8_list(dynamic raw) {
    return raw as Uint8List;
  }
}

// Section: api2wire

@protected
int api2wire_u32(int raw) {
  return raw;
}

@protected
int api2wire_u8(int raw) {
  return raw;
}

@protected
int api2wire_usize(int raw) {
  return raw;
}
// Section: finalizer

class RustPlatform extends FlutterRustBridgeBase<RustWire> {
  RustPlatform(ffi.DynamicLibrary dylib) : super(RustWire(dylib));

// Section: api2wire

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_String(String raw) {
    return api2wire_uint_8_list(utf8.encoder.convert(raw));
  }

  @protected
  int api2wire_u64(int raw) {
    return raw;
  }

  @protected
  ffi.Pointer<wire_uint_8_list> api2wire_uint_8_list(Uint8List raw) {
    final ans = inner.new_uint_8_list_0(raw.length);
    ans.ref.ptr.asTypedList(raw.length).setAll(0, raw);
    return ans;
  }

// Section: finalizer

// Section: api_fill_to_wire
}

// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_positional_boolean_parameters, annotate_overrides, constant_identifier_names

// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.

/// generated by flutter_rust_bridge
class RustWire implements FlutterRustBridgeWireBase {
  @internal
  late final dartApi = DartApiDl(init_frb_dart_api_dl);

  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  RustWire(ffi.DynamicLibrary dynamicLibrary) : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  RustWire.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void store_dart_post_cobject(
    ptr,
  ) {
    return _store_dart_post_cobject(
      ptr.address,
    );
  }

  late final _store_dart_post_cobjectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int)>>(
          'store_dart_post_cobject');
  late final _store_dart_post_cobject =
      _store_dart_post_cobjectPtr.asFunction<void Function(int)>();

  Object get_dart_object(
    int ptr,
  ) {
    return _get_dart_object(
      ptr,
    );
  }

  late final _get_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Handle Function(ffi.UintPtr)>>(
          'get_dart_object');
  late final _get_dart_object =
      _get_dart_objectPtr.asFunction<Object Function(int)>();

  void drop_dart_object(
    int ptr,
  ) {
    return _drop_dart_object(
      ptr,
    );
  }

  late final _drop_dart_objectPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UintPtr)>>(
          'drop_dart_object');
  late final _drop_dart_object =
      _drop_dart_objectPtr.asFunction<void Function(int)>();

  int new_dart_opaque(
    Object handle,
  ) {
    return _new_dart_opaque(
      handle,
    );
  }

  late final _new_dart_opaquePtr =
      _lookup<ffi.NativeFunction<ffi.UintPtr Function(ffi.Handle)>>(
          'new_dart_opaque');
  late final _new_dart_opaque =
      _new_dart_opaquePtr.asFunction<int Function(Object)>();

  int init_frb_dart_api_dl(
    ffi.Pointer<ffi.Void> obj,
  ) {
    return _init_frb_dart_api_dl(
      obj,
    );
  }

  late final _init_frb_dart_api_dlPtr =
      _lookup<ffi.NativeFunction<ffi.IntPtr Function(ffi.Pointer<ffi.Void>)>>(
          'init_frb_dart_api_dl');
  late final _init_frb_dart_api_dl = _init_frb_dart_api_dlPtr
      .asFunction<int Function(ffi.Pointer<ffi.Void>)>();

  void wire_encrypt_file_xchacha20(
    int port_,
    ffi.Pointer<wire_uint_8_list> input_file_path,
    ffi.Pointer<wire_uint_8_list> output_file_path,
    int padding,
  ) {
    return _wire_encrypt_file_xchacha20(
      port_,
      input_file_path,
      output_file_path,
      padding,
    );
  }

  late final _wire_encrypt_file_xchacha20Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.UintPtr)>>('wire_encrypt_file_xchacha20');
  late final _wire_encrypt_file_xchacha20 =
      _wire_encrypt_file_xchacha20Ptr.asFunction<
          void Function(int, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>, int)>();

  void wire_decrypt_file_xchacha20(
    int port_,
    ffi.Pointer<wire_uint_8_list> input_file_path,
    ffi.Pointer<wire_uint_8_list> output_file_path,
    ffi.Pointer<wire_uint_8_list> key,
    int padding,
    int last_chunk_index,
  ) {
    return _wire_decrypt_file_xchacha20(
      port_,
      input_file_path,
      output_file_path,
      key,
      padding,
      last_chunk_index,
    );
  }

  late final _wire_decrypt_file_xchacha20Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.UintPtr,
              ffi.Uint32)>>('wire_decrypt_file_xchacha20');
  late final _wire_decrypt_file_xchacha20 =
      _wire_decrypt_file_xchacha20Ptr.asFunction<
          void Function(
              int,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              int,
              int)>();

  void wire_generate_thumbnail_for_image_file(
    int port_,
    ffi.Pointer<wire_uint_8_list> image_type,
    ffi.Pointer<wire_uint_8_list> path,
    int exif_image_orientation,
  ) {
    return _wire_generate_thumbnail_for_image_file(
      port_,
      image_type,
      path,
      exif_image_orientation,
    );
  }

  late final _wire_generate_thumbnail_for_image_filePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Uint8)>>('wire_generate_thumbnail_for_image_file');
  late final _wire_generate_thumbnail_for_image_file =
      _wire_generate_thumbnail_for_image_filePtr.asFunction<
          void Function(int, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>, int)>();

  void wire_encrypt_xchacha20poly1305(
    int port_,
    ffi.Pointer<wire_uint_8_list> key,
    ffi.Pointer<wire_uint_8_list> nonce,
    ffi.Pointer<wire_uint_8_list> plaintext,
  ) {
    return _wire_encrypt_xchacha20poly1305(
      port_,
      key,
      nonce,
      plaintext,
    );
  }

  late final _wire_encrypt_xchacha20poly1305Ptr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_encrypt_xchacha20poly1305');
  late final _wire_encrypt_xchacha20poly1305 =
      _wire_encrypt_xchacha20poly1305Ptr.asFunction<
          void Function(int, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_decrypt_xchacha20poly1305(
    int port_,
    ffi.Pointer<wire_uint_8_list> key,
    ffi.Pointer<wire_uint_8_list> nonce,
    ffi.Pointer<wire_uint_8_list> ciphertext,
  ) {
    return _wire_decrypt_xchacha20poly1305(
      port_,
      key,
      nonce,
      ciphertext,
    );
  }

  late final _wire_decrypt_xchacha20poly1305Ptr = _lookup<
          ffi.NativeFunction<
              ffi.Void Function(
                  ffi.Int64,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>,
                  ffi.Pointer<wire_uint_8_list>)>>(
      'wire_decrypt_xchacha20poly1305');
  late final _wire_decrypt_xchacha20poly1305 =
      _wire_decrypt_xchacha20poly1305Ptr.asFunction<
          void Function(int, ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_hash_blake3_file(
    int port_,
    ffi.Pointer<wire_uint_8_list> path,
  ) {
    return _wire_hash_blake3_file(
      port_,
      path,
    );
  }

  late final _wire_hash_blake3_filePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_hash_blake3_file');
  late final _wire_hash_blake3_file = _wire_hash_blake3_filePtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_hash_blake3(
    int port_,
    ffi.Pointer<wire_uint_8_list> input,
  ) {
    return _wire_hash_blake3(
      port_,
      input,
    );
  }

  late final _wire_hash_blake3Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_hash_blake3');
  late final _wire_hash_blake3 = _wire_hash_blake3Ptr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  WireSyncReturn wire_hash_blake3_sync(
    ffi.Pointer<wire_uint_8_list> input,
  ) {
    return _wire_hash_blake3_sync(
      input,
    );
  }

  late final _wire_hash_blake3_syncPtr = _lookup<
      ffi.NativeFunction<
          WireSyncReturn Function(
              ffi.Pointer<wire_uint_8_list>)>>('wire_hash_blake3_sync');
  late final _wire_hash_blake3_sync = _wire_hash_blake3_syncPtr
      .asFunction<WireSyncReturn Function(ffi.Pointer<wire_uint_8_list>)>();

  void wire_verify_integrity(
    int port_,
    ffi.Pointer<wire_uint_8_list> chunk_bytes,
    int offset,
    ffi.Pointer<wire_uint_8_list> bao_outboard_bytes,
    ffi.Pointer<wire_uint_8_list> blake3_hash,
  ) {
    return _wire_verify_integrity(
      port_,
      chunk_bytes,
      offset,
      bao_outboard_bytes,
      blake3_hash,
    );
  }

  late final _wire_verify_integrityPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Uint64,
              ffi.Pointer<wire_uint_8_list>,
              ffi.Pointer<wire_uint_8_list>)>>('wire_verify_integrity');
  late final _wire_verify_integrity = _wire_verify_integrityPtr.asFunction<
      void Function(int, ffi.Pointer<wire_uint_8_list>, int,
          ffi.Pointer<wire_uint_8_list>, ffi.Pointer<wire_uint_8_list>)>();

  void wire_hash_bao_file(
    int port_,
    ffi.Pointer<wire_uint_8_list> path,
  ) {
    return _wire_hash_bao_file(
      port_,
      path,
    );
  }

  late final _wire_hash_bao_filePtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Int64, ffi.Pointer<wire_uint_8_list>)>>('wire_hash_bao_file');
  late final _wire_hash_bao_file = _wire_hash_bao_filePtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  void wire_hash_bao_memory(
    int port_,
    ffi.Pointer<wire_uint_8_list> bytes,
  ) {
    return _wire_hash_bao_memory(
      port_,
      bytes,
    );
  }

  late final _wire_hash_bao_memoryPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(ffi.Int64,
              ffi.Pointer<wire_uint_8_list>)>>('wire_hash_bao_memory');
  late final _wire_hash_bao_memory = _wire_hash_bao_memoryPtr
      .asFunction<void Function(int, ffi.Pointer<wire_uint_8_list>)>();

  ffi.Pointer<wire_uint_8_list> new_uint_8_list_0(
    int len,
  ) {
    return _new_uint_8_list_0(
      len,
    );
  }

  late final _new_uint_8_list_0Ptr = _lookup<
      ffi.NativeFunction<
          ffi.Pointer<wire_uint_8_list> Function(
              ffi.Int32)>>('new_uint_8_list_0');
  late final _new_uint_8_list_0 = _new_uint_8_list_0Ptr
      .asFunction<ffi.Pointer<wire_uint_8_list> Function(int)>();

  void free_WireSyncReturn(
    WireSyncReturn ptr,
  ) {
    return _free_WireSyncReturn(
      ptr,
    );
  }

  late final _free_WireSyncReturnPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(WireSyncReturn)>>(
          'free_WireSyncReturn');
  late final _free_WireSyncReturn =
      _free_WireSyncReturnPtr.asFunction<void Function(WireSyncReturn)>();
}

class _Dart_Handle extends ffi.Opaque {}

class wire_uint_8_list extends ffi.Struct {
  external ffi.Pointer<ffi.Uint8> ptr;

  @ffi.Int32()
  external int len;
}
