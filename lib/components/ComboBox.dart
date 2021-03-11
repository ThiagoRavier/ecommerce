import 'package:ecommerce/theme/theme.dart';
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
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: defaultRadius,
          border: Border.all(color: Theme.of(context).dividerColor),
          color: Colors.white,
        ),
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
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
