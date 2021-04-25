import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/components/CustomScaffold/BottomFrame.dart';
import 'package:ecommerce/components/GoldButton.dart';
import 'package:ecommerce/components/PurpleGradient.dart';
import 'package:ecommerce/models/CartItem.dart';
import 'package:ecommerce/screens/ProductPage/blocs/product_bloc.dart';
import 'package:ecommerce/screens/ShoppingCart/components/ShoppingCartCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCartBottom extends StatelessWidget {
  const AddToCartBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomFrame(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<CartCubit, CartState>(
              builder: (context, cartState) {
                return BlocBuilder<ProductCubit, ProductState>(
                  builder: (context, productState) {
                    var item = cartState.matchProduct(productState.cartProduct);
                    return item.ammount > 0
                        ? ShoppingCartCard(cartItem: item)
                        : SizedBox();
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(Icons.arrow_back),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: GoldButton(
                    label: 'Adicionar',
                    onPressed: () {
                      var cartProduct =
                          context.read<ProductCubit>().state.cartProduct;
                      const mensagem = 'Selecione um';
                      if (cartProduct.color == null) print(mensagem + 'a cor.');
                      if (cartProduct.size == null)
                        print(mensagem + ' tamanho.');
                      else if (cartProduct.color != null)
                        context.read<CartCubit>().addItem(
                            CartItem(cartProduct: cartProduct, ammount: 1));
                    },
                  ),
                ),
                SizedBox(width: 16),
                PurpleShade(Icon(
                  Icons.favorite_outline_rounded,
                  color: Colors.white,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
