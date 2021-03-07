import 'package:flutter/material.dart';
import 'PurpleGradient.dart';
import 'SearchBar.dart';

double alturaComSearch = 110.0;
double alturaSemSearch = 88.0;

class GradientAppBar extends StatelessWidget {
  final IconData iconLeft;
  final Widget rightCornerWidget;
  final String title;
  final Function callback;
  final Widget searchBar = SearchBar(
    callback: null,
    placeholder: 'What are you looking for?',
  );

  GradientAppBar({
    this.iconLeft,
    this.rightCornerWidget,
    this.title,
    this.callback,
    // this.searchBar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: searchBar != null ? alturaComSearch : alturaSemSearch,
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
                      Icon(this.iconLeft),
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
            // child: Container(
            //   // width: double.infinity,
            child: FractionallySizedBox(
              widthFactor: 0.85,
              child: this.searchBar,
              // ),
              // width: 400,
              // ),
            ),
            bottom: -21,
          ),
        ],
      ),
    );
  }
}
