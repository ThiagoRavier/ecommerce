import 'package:flutter/material.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:ecommerce/sizeConfig.dart';

class CatalogueTile extends StatelessWidget {
  const CatalogueTile({
    Key key,
    @required this.onTap,
    @required this.label,
    @required this.image,
  }) : super(key: key);

  final GestureTapCallback onTap;
  final String label;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: getProportionateScreenWidth(88),
        child: GestureDetector(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: defaultRadius,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 52, 40, 62),
                        Color.fromARGB(100, 52, 40, 62),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        letterSpacing: -0.15,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
