import 'package:flutter/material.dart';
import 'package:ecommerce/theme/theme.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class IncreaseDecreaseAmmount extends StatelessWidget {
  final int ammount;
  final Function(int) callback;

  const IncreaseDecreaseAmmount({this.ammount = 0, this.callback});

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        AmmountButton(
          // CupertinoIcons.plus_circle,
          icon: Icons.plus_one_rounded,
          callback: () {
            print('oi');
            callback(1);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(ammount.toString(),
              style: TextStyle(color: Theme.of(context).disabledColor)),
        ),
        AmmountButton(
          // CupertinoIcons.minus_circle,
          icon: Icons.plus_one_rounded,
          callback: () {
            print('oi');
            callback(-1);
          },
        ),
      ]),
    );
  }
}

class AmmountButton extends StatelessWidget {
  final IconData icon;
  final Function callback;

  const AmmountButton({Key key, this.icon, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Icon(
        icon,
        color: Theme.of(context).disabledColor,
        size: 24,
      ),
    );
  }
}
