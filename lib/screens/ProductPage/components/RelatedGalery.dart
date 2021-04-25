import 'package:ecommerce/components/ProductGrid.dart';
import 'package:ecommerce/components/SectionTitle.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:flutter/material.dart';

class RelatedGallery extends StatelessWidget {
  const RelatedGallery({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var direction = Axis.horizontal;
    return Column(
      children: [
        SectionTitle(title: 'Produtos Relacionados'),
        Container(
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: direction,
            child: ProductGrid(
              products: products,
              scrollAxis: direction,
              productWidth: 130,
            ),
          ),
        )
      ],
    );
  }
}
