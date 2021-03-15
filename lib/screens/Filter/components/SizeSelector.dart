import 'package:ecommerce/bloc/filter/filter_bloc.dart';
import 'package:ecommerce/components/SizeTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<String> sizes = [
  'PP',
  'P',
  'M',
  'G',
  'GG',
  'XG',
];

Builder sizeButtonBuilder(String label, bool selected) => Builder(
    builder: (BuildContext context) => GestureDetector(
          child: SizeTile(
            label: label,
            selected: selected,
          ),
          onTap: () => context.read<FilterCubit>().change(size: label),
        ));
