import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/PurpleGradient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartSubtotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/cart'),
      child: Container(
        decoration: purpleGradient(
          context: context,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
                child: IconTheme(
                  child: Icon(Icons.shopping_cart_outlined),
                  data: IconThemeData(
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
                child: Column(
                  children: [
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return Text(
                          formattedPrice(state.totalValue),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        return Text(
                          state.totalAmmount.toString() + ' itens',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
