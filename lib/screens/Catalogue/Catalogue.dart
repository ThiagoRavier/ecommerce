import 'package:ecommerce/screens/Catalogue/components/CatalogueCard.dart';
import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/models/ProductCategory.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Catalogue extends StatefulWidget {
  @override
  _CatalogueState createState() => _CatalogueState();
}

class _CatalogueState extends State<Catalogue> {
  Category category;
  Category subcategory;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Builder(
        builder: (BuildContext ctx) => Column(
          children: productCategories
              .where((c) => getSearchFunction(ctx)(c.name))
              .map<Widget>(
                (c) => GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/catalogue/products',
                          arguments: c); //TODO improve using bloc
                    },
                    child: CatalogueCard(productCategory: c)),
              )
              .toList(),
        ),
      ),
      appBarInfo: bottomTabButtons['/catalogue'],
      padding: EdgeInsets.all(16),
    );
  }
}
