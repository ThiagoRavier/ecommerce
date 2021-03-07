import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'routes.dart';
import 'theme/theme.dart';
import 'components/GradientAppBar.dart';
import 'components/CustomBottomBarNavigator.dart';
// import 'screens/home/home.dart';
// import 'screens/diario/diario.dart';
// import 'screens/adicionarRefeicao/adicionarRefeicao.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  var screenIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          body: Column(
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
      ),
    );
  }
}
