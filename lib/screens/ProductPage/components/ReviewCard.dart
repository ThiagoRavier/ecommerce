import 'package:ecommerce/components/CustomCard.dart';
import 'package:ecommerce/components/SectionTitleWithCornerLink.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: SectionTitleWithCornerLink(
        title: 'Avaliações',
        route: '/reviews',
      ),
      padding: EdgeInsets.all(16),
    );
  }
}
