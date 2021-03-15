import 'package:flutter/material.dart';
import 'CartProduct.dart';
import 'Product.dart';

class CartItem {
  CartProduct cartProduct;
  int ammount;

  CartItem({
    @required this.cartProduct,
    this.ammount = 1,
  });

  Product get product => cartProduct.product;
}
