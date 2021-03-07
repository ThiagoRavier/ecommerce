import 'package:flutter/material.dart';
import '../routes.dart';
import 'CartSubtotal.dart';

class CustomBottomBarNavigator extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final List<Widget> children;

  CustomBottomBarNavigator({
    Map<String, ScreenInfo> routes,
    this.onTap,
    this.currentIndex,
  }) : children = routes.keys.toList().map((String k) {
          int index = routes.keys.toList().indexOf(k);
          bool selected = currentIndex == index;
          ScreenInfo s = routes[k];
          return CustomBottomBarNavigatorItem(
            icon: selected ? s.iconSelected : s.iconUnselected,
            label: s.label,
            selected: selected,
            onTap: () {
              onTap(index);
            },
          );
        }).toList();

  @override
  Widget build(BuildContext context) {
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
                children: this.children,
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
    BottomNavigationBarThemeData b = Theme.of(context).bottomNavigationBarTheme;
    Color color = this.selected ? b.selectedItemColor : b.unselectedItemColor;
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
                IconTheme(
                  data: IconThemeData(
                    color: color,
                  ),
                  child: Icon(this.icon),
                ),
                Text(this.label,
                    style: TextStyle(
                      color: color,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
