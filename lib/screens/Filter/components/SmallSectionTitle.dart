import 'package:flutter/material.dart';

class SmallSectionTitle extends StatelessWidget {
  const SmallSectionTitle({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: Text(title, style: Theme.of(context).textTheme.headline3),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
