import 'package:flutter/material.dart';

class InStock extends StatelessWidget {
  const InStock({Key key, this.isInStock}) : super(key: key);

  final bool isInStock;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isInStock
            ? Text(
                'Em estoque',
                style: TextStyle(color: Colors.green),
              )
            : Text(
                'Produto Indisponível',
                style: TextStyle(color: Colors.red),
              ));
  }
}
