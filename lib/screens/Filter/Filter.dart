import 'package:ecommerce/components/CatalogueCard.dart';
import 'package:ecommerce/components/ComboBox.dart';
import 'package:ecommerce/components/TitleCard.dart';
import 'package:ecommerce/models/CatalogueTypes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/SizeTile.dart';
import 'package:ecommerce/components/GoldButton.dart';

class FilterScreen extends StatefulWidget {
  // FilterScreen({Key key}) : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool sizeSelected = false;
  int selectedCatalogueType = 0;

  @override
  Widget build(BuildContext context) {
    List<String> catalogueTypeOptions =
        catalogueTypes.map<String>((t) => t.name).toList();
    return Container(
      child: Column(
        children: [
          GoldButton(
            label: 'josakdopdka',
            onPressed: () {
              print('tapped');
            },
          ),
          SizeTile(
            label: 'XXG',
            selected: sizeSelected,
            onTap: () {
              print('tapped');
              setState(() {
                sizeSelected = !sizeSelected;
              });
            },
          ),
          ComboBox(
            selectedIndex: selectedCatalogueType,
            options: catalogueTypeOptions,
            onChanged: (selectedValue) {
              setState(() {
                selectedCatalogueType =
                    catalogueTypeOptions.indexOf(selectedValue);
              });
            },
          ),
          CatalogueCard(
            catalogueType: catalogueTypes[0],
          ),
          TitleCard(
            color: Theme.of(context).primaryColor,
            icon: Icons.favorite_outline,
            title: 'Favorite',
          )
        ],
      ),
    );
  }
}
