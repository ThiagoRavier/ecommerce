import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/components/CustomScaffold/CustomScaffold.dart';
import 'package:ecommerce/components/ShoppingBottomFrame.dart';
import 'package:ecommerce/models/CartItem.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/ShoppingCart/components/ShoppingCartCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShoppingCartCard Function(CartItem) generateCartCard =
        (i) => ShoppingCartCard(
              cartProduct: i.cartProduct,
              ammount: i.ammount,
            );
    var radius = Radius.circular(15);
    return CustomScaffold(
      appBarInfo: BottomBarInfo(
          hasSearch: false,
          rightCornerWidget: GestureDetector(
            onTap: () => context.read<CartCubit>().clearCart(),
            child: Icon(Icons.cleaning_services_rounded),
          ),
          label: 'Carrinho'),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) => state.items.isEmpty
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.5),
                child: Text('O carrinho está vazio.',
                    style: Theme.of(context).textTheme.headline2))
            : Column(children: [
                ...state.items
                    .sublist(0, state.items.length - 1)
                    .map(generateCartCard)
                    .toList(),
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: radius, bottomRight: radius),
                    child: generateCartCard(state.items.last)),
              ]),
      ),
      bottomNavigationBar: ShoppingBottomFrame(
        buttonLabel: 'Continuar',
        buttonAction: () => Navigator.pushNamed(context, '/finish-order'),
      ),
    );
  }
}
