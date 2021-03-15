import 'package:ecommerce/bloc/filter/filter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce/models/ProductColor.dart';
import 'package:flutter/material.dart';

class _ColorButton extends StatelessWidget {
  const _ColorButton({Key key, this.color, this.selected}) : super(key: key);

  final Color color;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(100);
    return Container(
      width: 47,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: selected
                    ? Theme.of(context).buttonColor
                    : Colors.transparent,
                width: 2),
            borderRadius: radius,
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Container(
                decoration: BoxDecoration(
              color: color,
              borderRadius: radius,
            )),
          ),
        ),
      ),
    );
  }
}

Builder colorButtonBuilder(ProductColor color, bool selected) =>
    Builder(builder: (BuildContext context) {
      return GestureDetector(
        onTap: () => context.read<FilterCubit>().change(color: color),
        child: _ColorButton(
          color: color.flutterColor,
          selected: selected,
        ),
      );
    });
