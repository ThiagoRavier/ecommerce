import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../sizeConfig.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  @required
  final String title;
  @required
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(kDefaultPadding)),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
                fontStyle: FontStyle.normal,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xff34283E),
                letterSpacing: -0.49),
          ),
          Spacer(),
          GestureDetector(
            onTap: press,
            child: Text(
              "Veja Tudo",
              style: GoogleFonts.lato(
                  fontStyle: FontStyle.normal,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff9b9b9b)),
            ),
          )
        ],
      ),
    );
  }
}
