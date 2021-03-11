import 'package:ecommerce/components/CatalogueCard.dart';
import 'package:ecommerce/components/GradientTopUserInfo.dart';
import 'package:ecommerce/components/GradientTopWithText.dart';
import 'package:ecommerce/components/ProductDisplay.dart';
import 'package:ecommerce/components/ShoppingCartCard.dart';
import 'package:ecommerce/models/CatalogueTypes.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/models/User.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool sizeSelected = false;
  int selectedCatalogueType = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GradientTopUserInfo(user: users[0]),
          // GradientTopWithText(text: 'Qual seu numero de telefone?'),
          // CatalogueCard(
          //   catalogueType: catalogueTypes[0],
          // ),
          // ProductDisplay(
          //   products[0],
          //   width: 163,
          // ),
          // ShoppingCartCard(
          //   product: products[0],
          //   ammount: 2,
          //   size: 'GG',
          // ),
        ],
      ),
    );
  }
}
