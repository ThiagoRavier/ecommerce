import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComboBox extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final Function(String) onChanged;

  const ComboBox({this.options, this.selectedIndex, this.onChanged});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> items =
        options.map<DropdownMenuItem<String>>((t) {
      return DropdownMenuItem(
        value: t,
        child: Text(t),
      );
    }).toList();
    return Container(
      decoration: inputDecoration(context),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: options[selectedIndex],
          items: items,
          onChanged: onChanged,
          isExpanded: true,
          icon: Padding(
            padding: EdgeInsets.only(
              right: 8,
            ),
            child: Icon(
              CupertinoIcons.chevron_down,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
