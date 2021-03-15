import 'package:ecommerce/components/CustomCard.dart';
import 'package:ecommerce/components/SmallTextWithArrow.dart';
import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key key, this.child, this.onTap}) : super(key: key);

  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: child),
            SmallTextWithArrow(
              text: 'Alterar',
              onTap: () {},
            )
          ],
        ));
  }
}
