import 'package:ecommerce/components/CustomScaffold.dart';
import 'package:ecommerce/components/ProductGrid.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/routes.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Builder(
        builder: (BuildContext ctx) => ProductGrid(
          products: products
              .where(
                (p) => p.isFavorite && getSearchFunction(ctx)(p.name),
              )
              .toList(),
        ),
      ),
      appBarInfo: bottomTabButtons['/favorites'],
    );
  }
}
