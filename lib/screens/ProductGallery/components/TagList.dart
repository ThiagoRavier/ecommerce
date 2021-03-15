import 'package:flutter/material.dart';
import 'package:ecommerce/screens/ProductGallery/components/Tag.dart';

class TagList extends StatefulWidget {
  final List<String> labels;

  TagList({this.labels});

  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {
  List<String> selectedList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.labels
                .map<Row>(
                  (t) => Row(
                    children: [
                      Tag(
                          label: t,
                          selected: selectedList.contains(t),
                          onTap: () => setState(() {
                                if (selectedList.contains(t))
                                  selectedList.remove(t);
                                else
                                  selectedList.add(t);
                              })),
                      SizedBox(width: 8.0)
                    ],
                  ),
                )
                .toList()),
      ),
    );
  }
}
