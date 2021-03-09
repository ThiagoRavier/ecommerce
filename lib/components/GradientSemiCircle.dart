import 'package:flutter/material.dart';
import 'PurpleGradient.dart';
// import 'dart:math' as math;

// enum CircleAlignment {
//   topLeft,
//   topRight,
//   bottomLeft,
//   bottomRight,
// }

class GradientSemiCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SemiCircleClipper(),
      child: Container(
        width: double.infinity,
        height: 197,
        decoration: purpleGradient(context: context),
      ),
    );
  }
}

class SemiCircleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - size.height,
      size.height,
    );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}

// class QuarterCirclePainter extends CustomPainter {
//   final CircleAlignment circleAlignment;
//   final Color color;

//   const QuarterCirclePainter({this.circleAlignment, this.color});

//   @override
//   void paint(Canvas canvas, Size size) {
//     final radius = math.min(size.height, size.width);
//     final offset = circleAlignment == CircleAlignment.topLeft
//         ? Offset(.0, .0)
//         : circleAlignment == CircleAlignment.topRight
//             ? Offset(size.width, .0)
//             : circleAlignment == CircleAlignment.bottomLeft
//                 ? Offset(.0, size.height)
//                 : Offset(size.width, size.height);
//     canvas.drawCircle(offset, radius, Paint()..color = color);
//   }

//   @override
//   bool shouldRepaint(QuarterCirclePainter oldDelegate) {
//     return color == oldDelegate.color &&
//         circleAlignment == oldDelegate.circleAlignment;
//   }
// }
