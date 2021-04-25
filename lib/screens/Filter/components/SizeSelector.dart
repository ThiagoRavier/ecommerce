import 'package:ecommerce/components/SizeTile.dart';
import 'package:flutter/material.dart';

List<String> sizes = [
  'PP',
  'P',
  'M',
  'G',
  'GG',
  'XG',
];

Builder sizeButtonBuilder(
        String label, bool selected, void Function(String) onTap) =>
    Builder(
        builder: (BuildContext context) => GestureDetector(
              child: SizeTile(
                label: label,
                selected: selected,
              ),
              onTap: () => onTap(label),
            ));
