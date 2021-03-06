import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'theme/theme.dart';
import 'components/GradientAppBar.dart';
import 'routes.dart';
// import 'screens/home/home.dart';
// import 'screens/diario/diario.dart';
// import 'screens/adicionarRefeicao/adicionarRefeicao.dart';

void main() => runApp(MyApp());

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
      ),
      // ),
    );
  }
}
