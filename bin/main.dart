import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:assignment_programming_2/assignment_programming_2.dart'
    as assignment_programming_2;

import 'pages/menu_model.dart';
import 'services/hive_service.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox(HiveServiceNotes.productHS);

  var product = Product(
      categoryOfProduct: "meal",
      nameOfProduct: "Spaghetti Bolognese",
      priceOfProduct: 12,
      receptOfProduct: ["Ingredients", "Instructions"],
      descriptionOfProduct: "Classic Italian pasta with meat sauce.");

  await HiveServiceNotes.storeProduct([product]);

  var a = await HiveServiceNotes.loadProduct();

  print(a);
}
