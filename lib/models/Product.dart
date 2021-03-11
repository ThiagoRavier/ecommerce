import 'package:flutter/material.dart';
import 'CatalogueTypes.dart';

class Product {
  String name;
  double price;
  double discountRate;
  CatalogueType category;
  double rating;
  String image;
  bool isFavorite;
  List<String> tamanhosDisponiveis;

  Product({
    @required this.name,
    @required this.price,
    @required this.category,
    @required this.rating,
    @required this.image,
    this.discountRate = 0,
    this.isFavorite = false,
    List<String> tamanhosDisponiveis,
  }) : this.tamanhosDisponiveis = tamanhosDisponiveis ?? ['U'];

  double getPriceWithDiscount() {
    return this.price * (1 - this.discountRate);
  }

  void toggleFavorite() {
    this.isFavorite = !(this.isFavorite ?? false);
    print(this.isFavorite);
  }
}

String formattedPrice(double value) {
  return 'R\$ ' + value.toStringAsFixed(2).replaceAll('.', ',');
}

List<Product> products = [
  Product(
    name: 'Saodimallsu Womens Turtleneck Oversized...',
    price: 99.0,
    discountRate: 0.5,
    category: catalogueTypes[0],
    rating: 4.5,
    image:
        "https://s3-alpha-sig.figma.com/img/5038/cb3b/c1aca521dc26292aa8ad303a45f15db6?Expires=1616371200&Signature=VG3smxRLbPD8ErSizbEVGrWTjUCpD~sKEbbW~80-LZeYKIWY36mB1brXCIyCUi1vQYmxl818Ozeptu2WxdYB8jdEMmAFBRN2fAByvGvpmguU3h-2WqLxC3DlZT4QdMOVI86NSAuNlhX~2H9Z88V3jAvbVLFGYoC~oLFo6wMdLAW0HQXIcs7PD6km6WoW3BJL84CMX3YlTM8RxjpNcY8-I9e4VYQchdUue6xyWkk4BT6lv482E~Y1Oj7QauJHCCUrv7UwzIp47rTIBbwWRCjJJu7E5yQOBpFtwnau24-h3D2sCuN8ylUMmsG~J-nkmb5dZLXuCR8cfuXB2wfBLMOALQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA",
  ),
];
