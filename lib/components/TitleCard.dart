import 'package:flutter/material.dart';
// import 'package:ecommerce/sizeConfig.dart';
import 'CustomCard.dart';
import 'PhotoBox.dart';
import 'PurpleGradient.dart';

class TitleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String image;
  final bool hasShade;

  TitleCard({this.icon, this.image, this.title, this.color})
      : hasShade = color == null;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
          ),
          child: Row(
            children: [
              Row(
                children: [
                  if (icon != null)
                    Padding(
                        padding: EdgeInsets.only(right: 12),
                        child: PurpleShade(
                            Icon(
                              icon,
                              color: color ?? Colors.white,
                            ),
                            active: hasShade)),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 17),
                  child: PurpleShade(
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: color ?? Colors.white,
                        ),
                      ),
                      active: hasShade),
                ),
              ),
              if (image != null)
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 88),
                  child: PhotoBox(image: image),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
