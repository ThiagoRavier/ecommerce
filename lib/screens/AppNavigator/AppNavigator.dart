import 'package:ecommerce/components/GradientAppBar.dart';
import 'package:ecommerce/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../routes.dart';

BottomNavigationBarItem Function(String) _mapRoutesIcon(int screenIndex) {
  return (String k) {
    int index = routes.keys.toList().indexOf(k);
    ScreenInfo s = routes[k];
    return BottomNavigationBarItem(
      icon: Icon(screenIndex == index ? s.iconSelected : s.iconUnselected),
      label: s.label,
    );
  };
}

class AppNavigator extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AppNavigator> {
  var screenIndex = 0;
  @override
  Widget build(BuildContext context) {
    var screenInfo = routes.values.toList()[screenIndex];
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        systemNavigationBarColor: Colors.black, // navigation bar color
        statusBarIconBrightness: Brightness.light, // status bar icons' color
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icons' color
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          items: routes.keys
              .toList()
              .map<BottomNavigationBarItem>(_mapRoutesIcon(screenIndex))
              .toList(),
          onTap: (int index) {
            setState(() {
              screenIndex = index;
            });
          },
          currentIndex: screenIndex,
          showUnselectedLabels: true,
        ),
        body:
            // SafeArea(child:
            Column(
          children: [
            GradientAppBar(
              title: screenInfo.label,
              iconLeft: screenInfo.iconLeft,
              rightCornerWidget: screenInfo.rightCornerWidget,
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: screenInfo.builder(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
