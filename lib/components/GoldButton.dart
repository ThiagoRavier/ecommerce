import 'package:flutter/material.dart';
import 'package:ecommerce/sizeConfig.dart';
import 'package:ecommerce/theme/theme.dart';

class GoldButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  GoldButton({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).buttonColor,
        borderRadius: defaultRadius,
      ),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: this.onPressed,
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(20.0)),
          child: Text(this.label,
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
