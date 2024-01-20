import 'dart:io';

import 'package:path_provider/path_provider.dart';

Future<void> saveDataToFile(String data) async {
  Directory directory = await getApplicationDocumentsDirectory();
  File file = File('${directory.path}/data.txt');
  await file.writeAsString(data);
}

Future<String> readDataFromFile() async {
  Directory directory = await getApplicationDocumentsDirectory();
  File file = File('${directory.path}/data.txt');
  if (await file.exists()) {
    return await file.readAsString();
  } else {
    return 'File not found';
  }
}