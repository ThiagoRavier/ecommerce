import 'package:flutter/material.dart';
import '../CircledIcon.dart';

class FavoriteIcon extends StatelessWidget {
  final bool isFavorite;
  final Function() onTap;

  const FavoriteIcon({this.isFavorite, this.onTap});

  @override
  Widget build(BuildContext context) {
    return CircledIcon(
      icon: isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
      color: isFavorite ? Theme.of(context).buttonColor : null,
      onTap: onTap,
    );
  }
}
