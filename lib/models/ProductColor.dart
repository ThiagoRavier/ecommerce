import 'package:flutter/material.dart';

class ProductColor {
  Color flutterColor;
  String name;
  List<String> alternateNames;

  ProductColor({
    @required this.flutterColor,
    @required this.name,
    this.alternateNames,
  });
}

List<ProductColor> colors = [
  ProductColor(flutterColor: Colors.red, name: 'Vermelho'),
  ProductColor(flutterColor: Colors.blue, name: 'Azul'),
  ProductColor(flutterColor: Colors.black, name: 'Preto'),
  ProductColor(flutterColor: Colors.green, name: 'Verde'),
  ProductColor(flutterColor: Colors.yellow, name: 'Amarelo'),
  ProductColor(flutterColor: Colors.pink, name: 'Rosa'),
  ProductColor(flutterColor: Colors.white, name: 'Branco'),
  ProductColor(flutterColor: Colors.grey, name: 'Cinza'),
];
