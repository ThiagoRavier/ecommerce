import 'package:ecommerce/models/User.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({Key key, this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    TextStyle h3 = Theme.of(context).textTheme.headline3;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user.fullName, style: h3.copyWith(color: Colors.black)),
        SizedBox(height: 6),
        Text(
          users[0].address.addressString,
          style: h3,
        ),
      ],
    );
  }
}
