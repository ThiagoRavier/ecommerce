import 'package:flutter/material.dart';

class SmallSectionTitle extends StatelessWidget {
  const SmallSectionTitle({Key key, this.title, this.topPadding = 24})
      : super(key: key);

  final String title;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topPadding),
        Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: Text(title, style: Theme.of(context).textTheme.headline3),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
