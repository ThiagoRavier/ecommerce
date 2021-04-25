import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/Models/Product.dart';

const red = Color(0xffCE3E3E);

class PriceWithDiscount extends StatelessWidget {
  final double price;
  final double discountRate;
  final double fontSizeRate;

  const PriceWithDiscount(
      {@required this.price, this.discountRate, this.fontSizeRate = 1});

  @override
  Widget build(BuildContext context) {
    bool hasDiscount = discountRate != null;
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 17 * fontSizeRate,
        fontWeight: FontWeight.w900,
      ),
      child: Wrap(
        children: [
          if (hasDiscount)
            Padding(
              padding: EdgeInsets.only(right: 4.0 * fontSizeRate),
              child: Text(
                formattedPrice(price * (1 - discountRate)),
                style: TextStyle(
                  color: red,
                ),
              ),
            ),
          Text(formattedPrice(price),
              style: hasDiscount
                  ? TextStyle(
                      color: Theme.of(context).disabledColor,
                      fontSize: 14 * fontSizeRate,
                      decoration: TextDecoration.lineThrough,
                    )
                  : TextStyle(
                      color: Colors.black,
                    )),
        ],
      ),
    );
  }
}
