import 'package:flutter/material.dart';

import '../../../components/PhotoBox.dart';

class UserPhoto extends StatelessWidget {
  final String image;
  const UserPhoto({Key key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.circular(50);
    return Container(
      height: 70,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          borderRadius: radius),
      child: PhotoBox(
        image: image,
        borderRadius: radius,
      ),
    );
  }
}
