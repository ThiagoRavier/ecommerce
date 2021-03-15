import 'package:flutter/material.dart';

import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/components/ProductDisplay/ProductDisplay.dart';
// import 'package:ecommerce/screens/Home/SectionTitle.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;

  const ProductGrid({Key key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Wrap(
          spacing: 17,
          runSpacing: 24,
          children: products
              .map<ProductDisplay>(
                (p) => ProductDisplay(p, width: 155),
              )
              .toList(),
        ),
      ),
    );
  }
}
