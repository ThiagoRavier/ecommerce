// import 'package:ecommerce/sizeConfig.dart';
import './SelectableTile.dart';
import 'package:flutter/material.dart';

class SizeTile extends StatelessWidget {
  final String label;
  final bool selected;
  final Function onTap;
  final bool disabled;

  SizeTile(
      {this.label, this.selected = false, this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    double width = 47;
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
