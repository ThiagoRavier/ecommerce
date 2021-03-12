import 'package:ecommerce/routes.dart';
// import 'package:ecommerce/sizeConfig.dart';
import 'package:flutter/material.dart';

// import 'components/TransparentStatusBar.dart';
import 'theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myAppTheme(),
      initialRoute: '/',
      onGenerateRoute: _appRouter.onGenerateRoute,
      // builder: (BuildContext ctx, Widget child) =>
      //     TransparentStatusBar(child: child),
    );
  }

  @override
  void dispose() {
    // _appRouter.dispose();
    super.dispose();
  }
}
