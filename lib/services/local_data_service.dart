import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Local Data Service
class LDS {
  // Main
  static File? _file;
  static final LDS instance = LDS._();

  LDS._();

  static const _fileName = 'app_data.json';

  Future<File> get _getFile async {
    if (_file != null) return _file!;

    _file = await _initFile();
    return _file!;
  }

  Future<File> _initFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/$_fileName').create();
  }

  Future<File> write(Map content) async {
    final File c = await _getFile;
    return await c.writeAsString(const JsonEncoder().convert(content));
  }

  Future<Map?> read() async {
    final File c = await _getFile;
    final data = await c.readAsString();
    return data.isNotEmpty ? const JsonDecoder().convert(data) : null;
  }
}
