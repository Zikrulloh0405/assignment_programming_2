import 'dart:convert';

import 'package:hive/hive.dart';

import '../pages/menu_model.dart';

class HiveServiceNotes {
  static const productHS = "hive_notes";
  static const productHSKey = "notes_project";

  static Box box = Hive.box(productHS);

  static Future<void> storeProduct(List<Product> noteList) async {
    List<String> stringList =
        noteList.map((note) => jsonEncode(note.toJson())).toList();
    await box.put(productHSKey, stringList);
  }

  static Future<List<Product>> loadProduct() async {
    List<String> stringList = box.get(productHSKey) ?? <String>[];
    List<Product> noteList =
        stringList.map((note) => Product.fromJson(jsonDecode(note))).toList();
    return noteList;
  }

  static Future<void> removeProduct() async {
    await box.delete(productHSKey);
  }

  // static Future<void> removeProductById(int noteId) async {
  //   List<Note> listNote = await loadProduct();
  //   listNote.removeWhere((element) => element.id == noteId);
  //   await storeProduct(listNote);
  // }
}
