import 'package:ecommerce/components/TitleCard.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/models/CatalogueTypes.dart';

class CatalogueCard extends StatelessWidget {
  final CatalogueType catalogueType;

  const CatalogueCard({this.catalogueType});

  @override
  Widget build(BuildContext context) {
    return TitleCard(
      title: catalogueType.name,
      image: catalogueType.image,
      color: Colors.black,
    );
  }
}
