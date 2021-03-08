import 'package:ecommerce/constants.dart';
import 'package:ecommerce/sizeConfig.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VerticalSpacing(),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(kDefaultPadding)),
            child: Row(
              children: [
                Text(
                  "Catálago",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff34283E),
                      letterSpacing: -0.49),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
