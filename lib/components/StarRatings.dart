import 'package:flutter/material.dart';
import 'dart:math' as Math;

const orange = Color(0xffF2994A);

class StarRatings extends StatelessWidget {
  final double rating;
  final width = 11.0;

  StarRatings({this.rating});

  @override
  Widget build(BuildContext context) {
    final int whole = rating.truncate();
    final double part = rating % 1;
    List<Widget> stars = List.filled(
      whole,
      SingleStar(width: width),
      growable: true,
    );
    stars.add(
      Container(
        // width: width * part,
        child: ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: part,
            child: SingleStar(width: width),
          ),
        ),
      ),
    );
    var greyStars = List.filled(
      5,
      SingleStar(
        width: this.width,
        color: Theme.of(context).dividerColor,
      ),
    );
    return Stack(
      children: [
        Row(
          children: greyStars,
        ),
        Row(
          children: stars,
        ),
      ],
    );
  }
}

class SingleStar extends StatelessWidget {
  final double width;
  final Color color;

  const SingleStar({this.width, this.color});

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? orange;
    return Container(
      child: ClipPath(
        clipper: StarClipper(numberOfPoints: 5, thickness: 0.4),
        child: Container(
          width: width,
          height: width,
          color: color,
        ),
      ),
    );
  }
}

class StarClipper extends CustomClipper<Path> {
  /// The number of points of the star
  final int numberOfPoints;
  final double thickness;

  StarClipper({this.numberOfPoints, this.thickness});

  @override
  Path getClip(Size size) {
    double width = size.width;
    double bigRadius = width / 2;
    double radius = width / 2 * thickness;
    double step = _degToRad(360 / numberOfPoints);
    // double tamanhoCurva = bigRadius / 5.5;
    // double midRadius = bigRadius - tamanhoCurva;
    // //c2 = a2 + b2 − 2ab cos(C)
    // //side**2 = bigRadius**2 + radius**2 - 2*bigRadius*radius*Math.cos(_degToRag(step/2));
    // double side = Math.sqrt(Math.pow(bigRadius, 2) +
    //     Math.pow(radius, 2) -
    //     2 * bigRadius * radius * Math.cos(_degToRad(step / 2)));
    // //double side/Math.sin(step/2) = radius/Math.sin(halfPointAngle)
    // //radius*Math.sin(step/2)/side = Math.sin(halfPointAngle);
    // var sinHalfPointAngle = radius * Math.sin(step / 2) / side;
    // var halfPointAngle = Math.asin(sinHalfPointAngle);
    // // Math.tan(halfPointAngle) = difX/tamanhoCurva;
    // // var difX = tamanhoCurva * Math.tan(halfPointAngle);

    // double side2 = tamanhoCurva / Math.cos(halfPointAngle);
    // double proporcSide = side2 / side;
    var path = Path();

    double max = 2 * Math.pi;

    path.moveTo(0, -width / 2);

    double difAlinharAcima = -Math.pi / 2;
    for (double angle = difAlinharAcima;
        angle < max + difAlinharAcima;
        angle += step) {
      // path.quadraticBezierTo(
      //   bigRadius * Math.cos(angle),
      //   bigRadius * Math.sin(angle),
      //   radius * Math.cos(angle + step / 2),
      //   radius * Math.sin(angle + step / 2),
      // bigRadius * Math.cos(angle + step),
      // bigRadius * Math.sin(angle + step),
      // );
      path.lineTo(
        bigRadius * Math.cos(angle),
        bigRadius * Math.sin(angle),
      );
      // path.lineTo(midRadius * Math.cos(angle + step / (2 * proporcSide)),
      //     midRadius * Math.sin(angle + step / (2 * proporcSide)));
      path.lineTo(
        radius * Math.cos(angle + step / 2),
        radius * Math.sin(angle + step / 2),
      );
    }

    path.close();
    path = path.shift(Offset(width / 2, width / 2));
    return path;
  }

  num _degToRad(num deg) => deg * (Math.pi / 180.0);

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    StarClipper oldie = oldClipper as StarClipper;
    return numberOfPoints != oldie.numberOfPoints ||
        thickness != oldie.thickness;
  }
}
