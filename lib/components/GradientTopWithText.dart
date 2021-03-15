import 'package:ecommerce/components/CustomScaffold/GradientSemiCircle.dart';
import 'package:flutter/material.dart';

class GradientTopWithText extends StatelessWidget {
  final String text;
  const GradientTopWithText({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientSemiCircle(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          height: 31 / 25,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        maxLines: 2,
      ),
      height: 180,
    );
  }
}
