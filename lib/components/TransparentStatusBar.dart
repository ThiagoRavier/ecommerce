import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransparentStatusBar extends StatelessWidget {
  final Widget child;
  const TransparentStatusBar({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}
