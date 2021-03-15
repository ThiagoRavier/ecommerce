import 'package:ecommerce/components/TitleCard.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/ProductCategory.dart';

class CatalogueCard extends StatelessWidget {
  final ProductCategory productCategory;

  const CatalogueCard({this.productCategory});

  @override
  Widget build(BuildContext context) {
    return TitleCard(
      title: productCategory.name,
      image: productCategory.image,
      color: Colors.black,
    );
  }
}
