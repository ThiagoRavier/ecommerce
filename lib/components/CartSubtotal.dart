import 'package:flutter/material.dart';
import 'PurpleGradient.dart';

class CartSubtotal extends StatelessWidget {
  final double subtotal;
  final int itemNumber;

  CartSubtotal({@required this.subtotal, @required this.itemNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Text(
                    'R\$ ' + this.subtotal.toString().replaceAll('.', ','),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    this.itemNumber.toString() + ' itens',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
