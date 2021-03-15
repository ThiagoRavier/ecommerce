import 'package:flutter/material.dart';
import '../PurpleGradient.dart';

class GradientSemiCircle extends StatelessWidget {
  final double height;
  final Widget child;

  const GradientSemiCircle({Key key, this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SemiCircleClipper(),
      child: Container(
        width: double.infinity,
        height: height,
        decoration: purpleGradient(context: context),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 50,
                ),
                child: child,
              ),
              SizedBox(height: 0.19 * height),
            ],
          ),
        ),
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
      size.width - size.height * 1.45,
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
