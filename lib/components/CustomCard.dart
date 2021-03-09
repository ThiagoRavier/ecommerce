import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({this.child});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: defaultRadius,
        ),
        child: child,
      ),
    );
  }
}
