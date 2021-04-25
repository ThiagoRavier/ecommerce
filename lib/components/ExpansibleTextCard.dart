import 'package:ecommerce/components/ExpansibleCard.dart';
import 'package:flutter/material.dart';

class ExpansibleTextCard extends StatelessWidget {
  const ExpansibleTextCard({Key key, this.title, this.text}) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ExpansibleCard(
      topWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline2),
          SizedBox(height: 8),
        ],
      ),
      child: Text(text),
    );
  }
}
