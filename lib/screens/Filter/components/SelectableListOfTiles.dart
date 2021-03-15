import 'package:ecommerce/screens/Filter/components/SmallSectionTitle.dart';
import 'package:flutter/material.dart';

class SelectableListOfTiles<T> extends StatelessWidget {
  const SelectableListOfTiles(
      {Key key,
      this.selectedIndexes,
      this.options,
      this.title,
      this.builderFunction})
      : super(key: key);

  final List<int> selectedIndexes;
  final List<T> options;
  final Builder Function(T, bool) builderFunction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SmallSectionTitle(
          title: title,
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
