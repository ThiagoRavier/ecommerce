import 'package:ecommerce/components/ComboBox.dart';
import 'SmallSectionTitle.dart';
import 'package:flutter/material.dart';

class ComboBoxWithTitle extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final String title;
  final Function(String) onChanged;

  const ComboBoxWithTitle(
      {Key key,
      @required this.options,
      @required this.title,
      @required this.selectedIndex,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallSectionTitle(title: title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ComboBox(
            options: options,
            selectedIndex: selectedIndex,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
