import 'package:ecommerce/components/PhotoBox.dart';
import 'package:ecommerce/components/PriceWithDiscount.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

import 'IncreaseDecreaseAmmount.dart';

class ShoppingCartCard extends StatelessWidget {
  final Product product;
  final String size;
  final int ammount;

  const ShoppingCartCard({Key key, this.product, this.ammount, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 117,
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 1),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 80,
              child: PhotoBox(
                image: product.image,
                borderRadius: defaultRadius,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 3,
                      style: TextStyle(fontSize: 14, height: 19 / 14),
                    ),
                    PriceWithDiscount(
                      price: product.price * ammount,
                      discountRate: product.discountRate,
                    ),
                  ],
                ),
              ),
            ),
            IncreaseDecreaseAmmount(
              ammount: ammount,
              callback: (int i) => print(i),
            ),
          ],
        ),
      ),
    );
  }
}
