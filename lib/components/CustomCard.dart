import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;

  const CustomCard({this.child, this.padding, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? defaultRadius,
      ),
      margin: EdgeInsets.only(
        bottom: 8,
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}
