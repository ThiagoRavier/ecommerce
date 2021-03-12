import 'package:ecommerce/components/CustomScaffold.dart';
import 'package:ecommerce/components/ProductGrid.dart';
import 'package:ecommerce/models/CatalogueTypes.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/ProductGallery/components/TagList.dart';
import 'package:flutter/material.dart';

class ProductGallery extends StatefulWidget {
  @override
  _ProductGalleryState createState() => _ProductGalleryState();
}

class _ProductGalleryState extends State<ProductGallery> {
  @override
  Widget build(BuildContext context) {
    CatalogueType category = ModalRoute.of(context).settings.arguments;
    return CustomScaffold(
      body: Builder(
          builder: (BuildContext ctx) => Column(
                children: [
                  TagList(labels: category.subcategories),
                  ProductGrid(
                    products: products
                        .where(
                          (p) =>
                              p.category == category &&
                              getSearchFunction(ctx)(p.name),
                        )
                        .toList(),
                  ),
                ],
              )),
      appBarInfo: ScreenInfo(
        label: category.name,
        hasSearch: true,
      ),
    );
  }
}
