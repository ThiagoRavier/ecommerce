import 'package:ecommerce/models/CartItem.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/CartProduct.dart';
import 'package:ecommerce/models/ProductColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    @required CartProduct cartProduct,
  }) : super(ProductState(cartProduct: cartProduct));

  void change(
          {ProductColor color, String size, Product product, int ammount}) =>
      emit(ProductState(
        cartProduct: CartProduct(
          product: product ?? state.cartProduct.product,
          color: color ?? state.cartProduct.color,
          size: size ?? state.cartProduct.size,
        ),
        ammount: state.ammount,
      ));

  void increase() => change(ammount: state.ammount + 1);
  void decrease() => change(ammount: state.ammount - 1);
}
