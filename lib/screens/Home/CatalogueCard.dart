import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:ecommerce/models/CatalogueTypes.dart';

import '../../sizeConfig.dart';

class CatalogueCard extends StatelessWidget {
  const CatalogueCard({
    Key key,
    this.press,
    this.index,
  }) : super(key: key);
  @required
  final GestureTapCallback press;
  @required
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SizedBox(
        width: getProportionateScreenWidth(88),
        child: GestureDetector(
          onTap: press,
          child: Stack(children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(catalogueTypes[index].image),
                        fit: BoxFit.cover)),
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(colors: [
                    Color.fromARGB(200, 52, 40, 62),
                    Color.fromARGB(100, 52, 40, 62)
                  ]),
                ),
              ),
            ),
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    catalogueTypes[index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        letterSpacing: -0.15),
                  ),
                ],
              )),
            ),
          ]),
        ),
      ),
    );
  }
}
