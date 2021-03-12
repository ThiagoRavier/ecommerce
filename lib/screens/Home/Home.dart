import 'package:ecommerce/models/CatalogueTypes.dart';
import 'package:ecommerce/screens/AppNavigator/components/CustomBottomBarNavigator.dart';
import 'package:ecommerce/screens/AppNavigator/components/GradientAppBar.dart';
import 'package:ecommerce/screens/Home/CatalogueTile.dart';
import 'package:ecommerce/screens/Home/SectionTitle.dart';
import 'package:ecommerce/sizeConfig.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GradientAppBar(
                title: 'Home',
                leftCornerWidget: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.menu_rounded),
                ),
                rightCornerWidget: Icon(Icons.notifications_none_outlined),
              ),
              VerticalSpacing(of: 10),
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
                              child: CatalogueTile(
                                index: index,
                                press: () {},
                              ),
                            ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBarNavigator(),
    );
  }
}
