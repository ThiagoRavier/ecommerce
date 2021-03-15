import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/SortableProductGrid.dart';
import 'package:ecommerce/models/ProductCategory.dart';
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
    ProductCategory category = ModalRoute.of(context).settings.arguments;
    return CustomScaffold(
      body: Builder(
          builder: (BuildContext ctx) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TagList(labels: category.subcategories),
                  SortableProductGrid(
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
      appBarInfo: BottomBarInfo(
          label: category.name,
          hasSearch: true,
          rightCornerWidget: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/filter'),
            child: Icon(Icons.filter_list_rounded),
          )),
    );
  }
}
