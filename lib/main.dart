import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:cards_app/models/items_model.dart';
import 'package:cards_app/screens/home_page.dart';



List<Products>? ProductList = [];
void main() {
  File productsFile =File("/Users/huss/Downloads/cards_app/lib/data/products.json");
  var stringProducts = productsFile.readAsStringSync();
  //print(stringProducts);
  var productData = json.decode(stringProducts);

  for (var element in productData["products"]) {
    ProductList!.add(Products.fromJson(element));
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
        ),
    );
  }
}
