import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecommerce/theme/theme.dart';
import './components/CustomBottomBarNavigator.dart';
import './components/GradientAppBar.dart';
import 'package:ecommerce/sizeConfig.dart';

import 'package:ecommerce/routes.dart';

class AppNavigator extends StatefulWidget {
  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  var screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var screenInfo = routes.values.toList()[screenIndex];
    return MaterialApp(
      theme: myAppTheme(),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // transparent status bar
          systemNavigationBarColor: Colors.black, // navigation bar color
          statusBarIconBrightness: Brightness.light, // status bar icons' color
          systemNavigationBarIconBrightness:
              Brightness.light, //navigation bar icons' color
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: CustomBottomBarNavigator(
            routes: routes,
            onTap: (int index) {
              setState(() {
                screenIndex = index;
              });
            },
            currentIndex: screenIndex,
          ),
          body: Container(
            child: Column(
              children: [
                GradientAppBar(
                  title: screenInfo.label,
                  iconLeft: screenInfo.iconLeft,
                  rightCornerWidget: screenInfo.rightCornerWidget,
                ),
                SingleChildScrollView(
                  child:
                      // Container(
                      //   clipBehavior: Clip.none,
                      //   child:
                      Container(
                    width: double.infinity,
                    child: screenInfo.builder(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
