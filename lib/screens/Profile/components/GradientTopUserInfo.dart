import 'package:ecommerce/components/CircledIcon.dart';
import 'package:ecommerce/components/GradientSemiCircle.dart';
import 'package:ecommerce/models/User.dart';
import 'package:flutter/material.dart';

import 'UserPhoto.dart';

class GradientTopUserInfo extends StatelessWidget {
  final User user;
  const GradientTopUserInfo({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GradientSemiCircle(
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserPhoto(image: users[0].profilePicture),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      children: [
                        Text(user.firstName + ' ' + user.lastName,
                            style: TextStyle(
                              fontSize: 19,
                              height: 23 / 19,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 8),
                        Text(user.phoneNumber),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          height: 146,
        ),
        Positioned(
          right: 16,
          bottom: 24,
          child: CircledIcon(
            icon: Icons.edit_outlined,
            width: 48,
            iconSize: 24,
            onTap: () {
              print('Go to edit user info');
            },
          ),
        ),
      ],
    );
  }
}
