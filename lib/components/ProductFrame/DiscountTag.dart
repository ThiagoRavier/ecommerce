import 'package:flutter/material.dart';

class DiscountTag extends StatelessWidget {
  final double discountRate;

  const DiscountTag({this.discountRate});

  @override
  Widget build(BuildContext context) {
    var r = Radius.circular(50);
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: Text(
          (100 * discountRate).toStringAsFixed(0) + '%',
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: r,
          bottomRight: r,
        ),
        gradient: LinearGradient(
          colors: [
            Color(0xffD23A3A),
            Color(0xffF49763),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}
