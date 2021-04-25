import 'package:ecommerce/components/SectionTitle.dart';
import 'package:ecommerce/components/SmallTextWithArrow.dart';
import 'package:flutter/material.dart';

class SectionTitleWithCornerLink extends StatelessWidget {
  const SectionTitleWithCornerLink({
    Key key,
    @required this.title,
    @required this.route,
  }) : super(key: key);

  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return SectionTitle(
      title: title,
      rightCornerWidget: SmallTextWithArrow(
        text: 'Ver Tudo',
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
