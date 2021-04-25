import 'package:ecommerce/models/CartItem.dart';
import 'package:ecommerce/models/CartProduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(items: []));

  void addItem(CartItem newItem) {
    if (!changeAmmount(newItem)) state.items.add(newItem);
    emit(CartState(items: state.items));
  }

  void removeItem(int indexToRemove) {
    state.items.removeAt(indexToRemove);
    emit(CartState(items: state.items));
  }

  bool changeAmmount(CartItem newItem) {
    for (CartItem i in state.items) {
      if (i.cartProduct == newItem.cartProduct) {
        i.ammount += newItem.ammount;
        if (i.ammount <= 0) state.items.remove(i);
        emit(CartState(items: state.items));
        return true;
      }
    }
    return false;
  }

  void clearCart() => emit(CartState(items: []));
}
