part of 'product_bloc.dart';

class ProductState extends CartItem {
  ProductState({
    @required CartProduct cartProduct,
    int ammount = 0,
  }) : super(
          cartProduct: cartProduct,
          ammount: ammount,
        );
}
