import 'package:flutter/material.dart';
import 'package:ecommerce/theme/theme.dart';
import 'PurpleGradient.dart';

class CircledIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double width;
  final double iconSize;
  final Function onTap;

  const CircledIcon(
      {this.icon, this.color, this.width = 36, this.iconSize = 20, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          boxShadow: [defaultShadow],
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            child: PurpleShade(
              Icon(
                icon,
                size: iconSize,
                color: color ?? Colors.white,
              ),
              active: color == null,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
