import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/components/ProductDisplay/DiscountTag.dart';
import 'package:ecommerce/components/PriceWithDiscount.dart';
import 'package:ecommerce/models/CartItem.dart';
import 'package:ecommerce/models/CartProduct.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/ProductColor.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'FavoriteIcon.dart';
import '../PhotoBox.dart';
import 'StarRatings.dart';

class ProductDisplay extends StatelessWidget {
  final Product product;
  final double width;

  const ProductDisplay(this.product, {this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CartCubit>().addItem(CartItem(
          cartProduct: CartProduct(
            product: product,
            size: 'P',
            color: ProductColor(flutterColor: Colors.black, name: 'preto'),
          ),
          ammount: 1)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width ?? double.infinity,
        ),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  child: PhotoBox(
                    image: product.image,
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
