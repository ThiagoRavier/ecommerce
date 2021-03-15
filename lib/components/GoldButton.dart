import 'package:flutter/material.dart';
import 'package:ecommerce/sizeConfig.dart';
import 'package:ecommerce/theme/theme.dart';

class GoldButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final EdgeInsetsGeometry padding;

  GoldButton({this.label, this.onPressed, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: defaultRadius,
        ),
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
      ),
    );
  }
}
