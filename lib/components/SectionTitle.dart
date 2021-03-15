import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

import '../sizeConfig.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    this.rightCornerWidget,
  }) : super(key: key);

  final String title;
  final Widget rightCornerWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline2,
          ),
          rightCornerWidget ?? Container(),
        ],
      ),
    );
  }
}
