import 'package:ecommerce/models/CatalogueTypes.dart';
import 'package:ecommerce/screens/Home/CatalogueCard.dart';
import 'package:ecommerce/screens/Home/SectionTitle.dart';
import 'package:ecommerce/sizeConfig.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          VerticalSpacing(),
          SectionTitle(
            title: "Catálago",
            press: () {},
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                    catalogueTypes.length,
                    (index) => Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenWidth(18)),
                          child: CatalogueCard(
                            index: index,
                            press: () {},
                          ),
                        ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
