import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileController {
  Future<String> getDirectory(String fileName) async {
    return "${(await getApplicationDocumentsDirectory()).path}/$fileName";
  }

  Future<bool> write(String data, String fileName) async {
    try {
      await File(await getDirectory(fileName)).writeAsString(data);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<String?> read(String fileName) async {
    try {
      var path = await getDirectory(fileName);
      return await File(path).readAsString();
    } on Exception catch (_) {
      return null;
    }
  }
}
