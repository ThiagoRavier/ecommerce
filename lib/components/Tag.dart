import './SelectableTile.dart';
import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String label;
  final bool selected;
  final Function onTap;

  Tag({this.label, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTextStyle(
        style: TextStyle(fontSize: 13),
        child: SelectableTile(
          label: this.label,
          selected: this.selected,
          onTap: this.onTap,
          customBorderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
