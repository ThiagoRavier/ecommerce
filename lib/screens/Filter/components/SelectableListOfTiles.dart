import 'package:ecommerce/screens/Filter/components/SmallSectionTitle.dart';
import 'package:flutter/material.dart';

class SelectableListOfTiles<T> extends StatelessWidget {
  const SelectableListOfTiles({
    Key key,
    this.selectedIndexes,
    this.options,
    this.title,
    this.builderFunction,
    this.enabledIndexes,
    this.onTap,
    this.topPadding = 24,
  }) : super(key: key);

  final List<int> selectedIndexes;
  final List<int> enabledIndexes;
  final List<T> options;
  final Builder Function(T, bool, void Function(T)) builderFunction;
  final String title;
  final double topPadding;
  final void Function(T) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallSectionTitle(
          title: title,
          topPadding: topPadding,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 16),
              ...options
                  .map<Row>((c) => Row(
                        children: [
                          builderFunction(
                            c,
                            selectedIndexes.contains(options.indexOf(c)),
                            onTap,
                          ),
                          SizedBox(width: 12),
                        ],
                      ))
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
