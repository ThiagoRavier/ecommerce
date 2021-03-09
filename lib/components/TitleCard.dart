import 'package:flutter/material.dart';
// import 'package:ecommerce/sizeConfig.dart';
import 'CustomCard.dart';

class TitleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;
  final String image;

  TitleCard({this.icon, this.image, this.title, Color color})
      : this.color = color ?? Colors.black;

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
              if (icon != null)
                Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 17),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ),
              if (image != null)
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    height: 88,
                    width: 88,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
