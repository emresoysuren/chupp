import 'dart:typed_data';

class PickerResult {
  // If the bytes is null, the photo will be removed.
  final Uint8List? bytes;

  // To reset
  final bool reset;

  PickerResult({this.bytes, this.reset = false});
}
