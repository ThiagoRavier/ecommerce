import 'package:flutter/material.dart';

class PhotoBox extends StatelessWidget {
  final String image;
  final BorderRadius borderRadius;
  final BoxFit fit;

  const PhotoBox({this.image, this.borderRadius, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image),
              fit: fit,
            ),
          ),
        ),
      ),
    );
  }
}
