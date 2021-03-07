import 'package:ecommerce/screens/AppNavigator/AppNavigator.dart';
import 'package:flutter/material.dart';

import 'theme/theme.dart';

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
  @override
  Widget build(BuildContext context) {

    return MaterialApp(theme: myAppTheme(), home: AppNavigator()
        // ),
        );

  }
}
