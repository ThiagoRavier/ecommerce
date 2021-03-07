import 'package:ecommerce/sizeConfig.dart';
import './SelectableTile.dart';
import 'package:flutter/material.dart';

class SizeTile extends StatelessWidget {
  final String label;
  final bool selected;
  final Function onTap;

  SizeTile({this.label, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    double width = getProportionateScreenWidth(47);
    return Container(
      width: width,
      child: AspectRatio(
          aspectRatio: 1,
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 14,
            ),
            child: SelectableTile(
              label: this.label,
              selected: this.selected,
              onTap: this.onTap,
              unselectedHasBorder: true,
            ),
          )),
    );
  }
}
