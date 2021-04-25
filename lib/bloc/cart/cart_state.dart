part of 'cart_bloc.dart';

class CartState {
  List<CartItem> items;
  String discountCode;
  double shippingCost;
  // double cartDiscountValue;
  // double Function(Product) conditionalDiscount;

  CartState({
    @required this.items,
    this.discountCode = '',
    this.shippingCost = 0,
    // this.cartDiscountValue,
  });

  double get itemsValue {
    if (items.isEmpty) return 0;
    return items
        .map<double>(
            (c) => c.product.price * (1 - c.product.discountRate) * c.ammount)
        .reduce((total, value) => total += value);
  }

  double get totalValue => itemsValue + shippingCost;

  int get totalAmmount {
    if (items.isEmpty) return 0;
    return items
        .map((c) => c.ammount)
        .reduce((total, ammount) => total += ammount);
  }

  CartItem matchProduct(CartProduct cartProduct) {
    for (var i in items) if (cartProduct == i.cartProduct) return i;
    return CartItem(cartProduct: cartProduct, ammount: 0);
  }
}
