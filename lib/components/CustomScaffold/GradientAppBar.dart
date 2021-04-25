// import 'package:ecommerce/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/components/PurpleGradient.dart';
import 'SearchBar.dart';

class GradientAppBar extends StatelessWidget {
  final Widget leftCornerWidget;
  final Widget rightCornerWidget;
  final String title;
  final Function callback;
  final SearchBar searchBar;

  GradientAppBar({
    this.leftCornerWidget,
    this.rightCornerWidget,
    this.title,
    this.callback,
    this.searchBar,
  });

  @override
  Widget build(BuildContext context) {
    bool hasSearch = searchBar != null;
    double backgoundHeight = //getProportionateScreenHeight
        (hasSearch ? 110 : 88);
    return Container(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: backgoundHeight,
            decoration: purpleGradient(context: context),
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 45.0),
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      leftCornerWidget ??
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(Icons.arrow_back),
                          ),
                      Text(
                        this.title,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      this.rightCornerWidget ??
                          Visibility(
                            child: Icon(Icons.arrow_right),
                            visible: false,
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: this.searchBar,
            ),
            bottom: -22,
          ),
        ],
      ),
    );
  }
}
