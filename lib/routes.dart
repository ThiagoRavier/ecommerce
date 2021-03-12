import 'package:ecommerce/screens/Catalogue/Catalogue.dart';
import 'package:ecommerce/screens/Favorites/Favorites.dart';
import 'package:ecommerce/screens/Filter/Filter.dart';
import 'package:ecommerce/screens/Home/Home.dart';
import 'package:ecommerce/screens/ProductGallery/ProductGallery.dart';
import 'package:ecommerce/screens/Profile/UserProfile.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    MaterialPageRoute generateRoute(builder) =>
        MaterialPageRoute(settings: settings, builder: builder);
    switch (settings.name) {
      case '/':
        return generateRoute((_) => Home());
        break;
      case '/catalogue':
        return generateRoute((_) => Catalogue());
        break;
      case '/catalogue/products':
        return generateRoute((_) => ProductGallery());
        break;
      case '/filter':
        return generateRoute((_) => FilterScreen());
        break;
      case '/favorites':
        return generateRoute((_) => Favorites());
        break;
      case '/profile':
        return generateRoute((_) => UserProfile());
        break;
      // case '/product':
      //   break;
      // case '/login':
      //   break;
      // case '/cart':
      //   break;
      // case '/payment':
      //   break;
      default:
        return MaterialPageRoute(settings: settings, builder: (_) => Home());
    }
  }
}

// import 'package:flutter/widgets.dart';
// import 'screens/Home/Home.dart';
// // import 'screens/Catalogue/Catalogue.dart';
// import 'screens/Filter/Filter.dart';

class ScreenInfo {
  String label;
  WidgetBuilder builder;
  IconData iconSelected;
  IconData iconUnselected;
  IconData iconLeft;
  Widget rightCornerWidget;
  bool hasSearch;
  String searchPlaceholder;

  ScreenInfo({
    this.label,
    this.builder,
    this.iconSelected,
    this.iconUnselected,
    this.rightCornerWidget,
    IconData iconLeft,
    this.hasSearch = false,
  });
}

final Map<String, ScreenInfo> bottomTabButtons = <String, ScreenInfo>{
  "/": ScreenInfo(
    builder: (BuildContext context) => Home(),
    label: 'Home',
    iconSelected: Icons.home,
    iconUnselected: Icons.home_outlined,
    iconLeft: Icons.menu_rounded,
    rightCornerWidget: Icon(Icons.notifications_none_outlined),
    hasSearch: true,
  ),
  "/catalogue": ScreenInfo(
    builder: (BuildContext context) => FilterScreen(),
    label: 'Catalogue',
    iconSelected: CupertinoIcons.rectangle_grid_2x2_fill,
    iconUnselected: CupertinoIcons.rectangle_grid_2x2,
    hasSearch: true,
  ),
  "/favorites": ScreenInfo(
    builder: (BuildContext context) => Text('Favorites'),
    label: 'Favorites',
    iconSelected: Icons.favorite_rounded,
    iconUnselected: Icons.favorite_border_rounded,
    rightCornerWidget: Icon(Icons.notifications_none_outlined),
    hasSearch: true,
  ),
  "/profile": ScreenInfo(
    builder: (BuildContext context) => Text('Profile'),
    label: 'Profile',
    iconSelected: Icons.person_rounded,
    iconUnselected: Icons.person_outline_rounded,
  ),
};
