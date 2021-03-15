import 'package:ecommerce/models/PaymentMethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({Key key, this.paymentMethod}) : super(key: key);

  final PaymentMethod paymentMethod;

  @override
  Widget build(BuildContext context) {
    TextStyle h3 = Theme.of(context).textTheme.headline3;
    return Row(
      children: [
        Container(
            width: 36,
            height: 27,
            child: Image(image: NetworkImage(paymentMethod.image))),
        SizedBox(width: 12),
        Text(paymentMethod.nickname, style: h3.copyWith(color: Colors.black)),
      ],
    );
  }
}
