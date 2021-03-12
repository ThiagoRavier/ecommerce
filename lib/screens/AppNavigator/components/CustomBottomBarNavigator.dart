import 'package:flutter/material.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/components/PurpleGradient.dart';
import 'CartSubtotal.dart';

class CustomBottomBarNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var children = bottomTabButtons.keys.toList().map((String k) {
      bool selected =
          k.matchAsPrefix(ModalRoute.of(context).settings.name) != null;
      ScreenInfo s = bottomTabButtons[k];
      return CustomBottomBarNavigatorItem(
        icon: selected ? s.iconSelected : s.iconUnselected,
        label: s.label,
        selected: selected,
        onTap: () => Navigator.pushNamed(context, k),
      );
    }).toList();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
            ),
            color: Colors.white,
          ),
          height: 72,
          child: Padding(
            padding: EdgeInsets.only(left: 5.0),
            child: Container(
              child: Row(
                children: children,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: -16,
          child: CartSubtotal(
            subtotal: 100.0,
            itemNumber: 2,
          ),
        ),
      ],
    );
  }
}

class CustomBottomBarNavigatorItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final void Function() onTap;

  CustomBottomBarNavigatorItem(
      {this.icon, this.label, this.selected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          onTap: this.onTap,
          child: Padding(
            padding:
                EdgeInsets.only(top: 14.0, left: 6.0, right: 6.0, bottom: 6.0),
            child: Column(
              children: [
                PurpleShade(
                  Icon(this.icon, color: Colors.white),
                ),
                PurpleShade(Text(
                  this.label,
                  style: TextStyle(color: Colors.white),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
