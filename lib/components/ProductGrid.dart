import 'package:flutter/material.dart';

import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/components/ProductFrame/ProductFrame.dart';
// import 'package:ecommerce/screens/Home/SectionTitle.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final double productWidth;
  final Axis scrollAxis;

  const ProductGrid(
      {Key key,
      @required this.products,
      this.productWidth = 155,
      this.scrollAxis = Axis.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scrollAxis == Axis.vertical ? double.infinity : null,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Wrap(
          spacing: 17,
          runSpacing: 24,
          children: products
              .map<ProductFrame>((p) => ProductFrame(p, width: productWidth))
              .toList(),
        ),
      ),
    );
  }
}
