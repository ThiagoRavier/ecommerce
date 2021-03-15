import 'package:ecommerce/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/components/CustomScaffold/BottomFrame.dart';
import 'package:ecommerce/components/GoldButton.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingBottomFrame extends StatelessWidget {
  const ShoppingBottomFrame({Key key, this.buttonLabel, this.buttonAction})
      : super(key: key);

  final String buttonLabel;
  final GestureTapCallback buttonAction;

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: BottomFrame(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state.shippingCost != null)
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.headline4,
                      child: Column(
                        children: [
                          _SpacedTextRow(
                              ['Itens', formattedPrice(state.itemsValue)]),
                          SizedBox(height: 8),
                          _SpacedTextRow(
                              ['Entrega', formattedPrice(state.shippingCost)]),
                        ],
                      ),
                    ),
                  SizedBox(height: 16),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.headline2,
                    child: _SpacedTextRow(
                      ['Preço Total', formattedPrice(state.totalValue)],
                    ),
                  ),
                  SizedBox(height: 16),
                  GoldButton(
                    label: buttonLabel,
                    onPressed: buttonAction,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SpacedTextRow extends StatelessWidget {
  const _SpacedTextRow(this.texts, {Key key}) : super(key: key);

  final List<String> texts;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: texts.map((t) => Text(t)).toList());
  }
}
