import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// import 'screens/home/home.dart';

class ScreenInfo {
  String label;
  WidgetBuilder builder;
  IconData iconSelected;
  IconData iconUnselected;
  IconData iconLeft;
  Widget rightCornerWidget;

  ScreenInfo(
      {this.label,
      this.builder,
      this.iconSelected,
      this.iconUnselected,
      this.rightCornerWidget,
      IconData iconLeft}) {
    this.iconLeft = iconLeft ?? Icons.arrow_back;
  }
}

final Map<String, ScreenInfo> routes = <String, ScreenInfo>{
  "home": ScreenInfo(
    builder: (BuildContext context) => Text('Home'),
    label: 'Home',
    iconSelected: Icons.home,
    iconUnselected: Icons.home_outlined,
    iconLeft: Icons.menu_rounded,
    rightCornerWidget: Icon(Icons.notifications_none_outlined),
  ),
  "catalogue": ScreenInfo(
    builder: (BuildContext context) => Text('Catalogue'),
    label: 'Catalogue',
    iconSelected: Icons.grid_view,
    iconUnselected: Icons.grid_view,
  ),
  "favorites": ScreenInfo(
    builder: (BuildContext context) => Text('Favorites'),
    label: 'Favorites',
    iconSelected: Icons.favorite_rounded,
    iconUnselected: Icons.favorite_border_rounded,
    rightCornerWidget: Icon(Icons.notifications_none_outlined),
  ),
  "profile": ScreenInfo(
    builder: (BuildContext context) => Text('Profile'),
    label: 'Profile',
    iconSelected: Icons.person_rounded,
    iconUnselected: Icons.person_outline_rounded,
  ),
};
