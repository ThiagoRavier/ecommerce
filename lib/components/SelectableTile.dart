import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class SelectableTile extends StatelessWidget {
  final String label;
  final bool selected;
  final Function onTap;
  final BorderRadius borderRadius;
  final bool unselectedHasBorder;

  SelectableTile({
    this.label,
    this.selected,
    this.onTap,
    unselectedHasBorder,
    BorderRadius customBorderRadius,
  })  : borderRadius = customBorderRadius ?? defaultRadius,
        unselectedHasBorder = unselectedHasBorder ?? false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: this.selected ? Theme.of(context).buttonColor : Colors.white,
          borderRadius: borderRadius,
          border: Border.all(
              color: this.selected || !this.unselectedHasBorder
                  ? Colors.transparent
                  : Theme.of(context).dividerColor),
        ),
        child: Padding(
          child: Text(
            this.label,
            softWrap: false,
            style: TextStyle(
              color: this.selected ? Colors.white : Colors.black,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        ),
      ),
    );
  }
}
