import 'package:ecommerce/components/ProductFrame/DiscountTag.dart';
import 'package:ecommerce/components/PriceWithDiscount.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

import 'FavoriteIcon.dart';
import '../PhotoBox.dart';
import 'StarRatings.dart';

class ProductFrame extends StatelessWidget {
  final Product product;
  final double width;

  const ProductFrame(this.product, {this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/product', arguments: product),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width ?? double.infinity,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  child: PhotoBox(
                    image: product.images[0],
                    borderRadius: defaultRadius,
                  ),
                ),
                if (product.discountRate > 0)
                  Positioned(
                    top: 8,
                    child: DiscountTag(discountRate: product.discountRate),
                  ),
                Positioned(
                  bottom: -18,
                  right: 8,
                  child: FavoriteIcon(
                    isFavorite: false,
                    onTap: product.toggleFavorite,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            StarRatings(rating: product.rating),
            SizedBox(height: 8),
            Text(
              product.name,
              maxLines: 2,
              style: TextStyle(
                fontSize: 17,
                height: 19 / 17,
              ),
            ),
            SizedBox(height: 6),
            PriceWithDiscount(
              price: product.price,
              discountRate: product.discountRate,
            ),
          ],
        ),
      ),
    );
  }
}
