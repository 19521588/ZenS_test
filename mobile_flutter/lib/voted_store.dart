import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class VotedStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<List<String>> readFile() async {
    try {
      final file = await _localFile;
      List<String> temp = [];
      // Read the file
      final contents = await file.readAsString();
      contents
          .replaceAll("[", "")
          .replaceAll("]", "")
          .split(",")
          .forEach((element) {
        temp.add(element);
      });
      return temp;
    } catch (e) {
      // If encountering an error, return 0
      return [];
    }
  }

  Future<File> writeFile(List<String> list) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString('$list');
  }
}
