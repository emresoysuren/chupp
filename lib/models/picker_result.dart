import 'dart:typed_data';

class PickerResult {
  // If the bytes is null, the photo will be removed.
  final Uint8List? bytes;

  PickerResult({this.bytes});
}
