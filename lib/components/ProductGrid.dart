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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${products.length} itens'),
              Row(
                children: [Text('Ordenar por: '), Text('Popularidade')],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
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
        ],
      ),
    );
  }
}
