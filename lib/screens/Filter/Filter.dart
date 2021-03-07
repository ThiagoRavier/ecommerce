import 'package:ecommerce/components/SizeTile.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/GoldButton.dart';
import 'package:ecommerce/components/TagList.dart';

class FilterScreen extends StatefulWidget {
  // FilterScreen({Key key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool sizeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TagList(labels: ['Todos', 'Vestidos', 'Calças', 'Blusas'])
        // Column(
        //   children: [
        //     GoldButton(
        //       label: 'josakdopdka',
        //       onPressed: () {
        //         print('tapped');
        //       },
        //     ),
        //     SizeTile(
        //       label: 'XXG',
        //       selected: sizeSelected,
        //       onTap: () {
        //         print('tapped');
        //         setState(() {
        //           sizeSelected = !sizeSelected;
        //         });
        //       },
        //     ),
        //   ],
        // ),
        );
  }
}
