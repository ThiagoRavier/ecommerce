import 'package:flutter/material.dart';

class SmallTextWithArrow extends StatelessWidget {
  const SmallTextWithArrow({Key key, this.text, this.onTap}) : super(key: key);

  final String text;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    TextStyle h4 = Theme.of(context).textTheme.headline4;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            text,
            style: h4,
          ),
          Icon(Icons.arrow_forward_ios, size: 16, color: h4.color),
        ],
      ),
    );
  }
}
