import 'package:flutter/material.dart';

class BottomFrame extends StatelessWidget {
  const BottomFrame({
    Key key,
    @required this.child,
    this.height,
  }) : super(key: key);

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(24.0);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      height: height,
      child: child,
    );
  }
}
