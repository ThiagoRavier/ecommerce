import 'package:ecommerce/screens/Catalogue/Catalogue.dart';
import 'package:ecommerce/screens/Favorites/Favorites.dart';
import 'package:ecommerce/screens/Filter/FilterScreen.dart';
import 'package:ecommerce/screens/FinishOrder/FinishOrder.dart';
import 'package:ecommerce/screens/Home/Home.dart';
import 'package:ecommerce/screens/ProductGallery/ProductGallery.dart';
import 'package:ecommerce/screens/Profile/UserProfile.dart';
import 'package:ecommerce/screens/ShoppingCart/ShoppingCart.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart/cart_bloc.dart';
import 'bloc/filter/filter_bloc.dart';

BlocProvider<T> Function(BuildContext) Function(Widget)
    _providerBuilder<T extends Cubit<Object>>(T bloc) =>
        (Widget child) => (_) => BlocProvider<T>.value(
              value: bloc,
              child: child,
            );

class AppRouter {
  var _cartProvider = _providerBuilder<CartCubit>(CartCubit());
  var _filterProvider = _providerBuilder<FilterCubit>(FilterCubit());

  Route onGenerateRoute(RouteSettings settings) {
    MaterialPageRoute generateRoute(builder,
        {List<BlocProvider Function(BuildContext) Function(Widget)>
            providers}) {
      return MaterialPageRoute(
        settings: settings,
        builder: (providers ?? []).fold<Widget Function(BuildContext)>(
          builder,
          (previousValue, provider) {
            // if (bloc is Cubit<Object>)
            return provider(Builder(builder: previousValue));
          },
        ),
      );
    }

    switch (settings.name) {
      case '/home':
        return generateRoute((_) => Home(), providers: [_cartProvider]);
        break;
      case '/catalogue':
        return generateRoute((_) => Catalogue(), providers: [_cartProvider]);
        break;
      case '/catalogue/products':
        return generateRoute((_) => ProductGallery(),
            providers: [_cartProvider, _filterProvider]);
        break;
      case '/filter':
        return generateRoute((_) => FilterScreen(),
            providers: [_filterProvider]);
        break;
      case '/favorites':
        return generateRoute((_) => Favorites(),
            providers: [_cartProvider, _filterProvider]);
        break;
      case '/profile':
        return generateRoute((_) => UserProfile(), providers: [_cartProvider]);
        break;
      // case '/product':
      //   break;
      // case '/login':
      //   break;
      case '/cart':
        return generateRoute((_) => ShoppingCart(), providers: [_cartProvider]);
        break;
      case '/finish-order':
        return generateRoute((_) => FinishOrder(), providers: [_cartProvider]);
        break;
      default:
        return generateRoute((_) => Home(), providers: [_cartProvider]);
    }
  }
}

class BottomBarInfo {
  String label;
  WidgetBuilder builder;
  IconData iconSelected;
  IconData iconUnselected;
  Widget leftCornerWidget;
  Widget rightCornerWidget;
  bool hasSearch;
  String searchPlaceholder;

  BottomBarInfo({
    this.label,
    this.iconSelected,
    this.iconUnselected,
    this.rightCornerWidget,
    Widget leftCornerWidget,
    this.hasSearch = false,
    this.searchPlaceholder,
  });
}

final Map<String, BottomBarInfo> bottomTabButtons = <String, BottomBarInfo>{
  '/home': BottomBarInfo(
    label: 'Home',
    iconSelected: Icons.home,
    iconUnselected: Icons.home_outlined,
    leftCornerWidget: GestureDetector(
      onTap: () {},
      child: Icon(Icons.menu_rounded),
    ),
    rightCornerWidget: Icon(Icons.notifications_none_outlined),
    hasSearch: true,
  ),
  '/catalogue': BottomBarInfo(
    label: 'Catalogue',
    iconSelected: CupertinoIcons.rectangle_grid_2x2_fill,
    iconUnselected: CupertinoIcons.rectangle_grid_2x2,
    hasSearch: true,
  ),
  '/favorites': BottomBarInfo(
    label: 'Favorites',
    iconSelected: Icons.favorite_rounded,
    iconUnselected: Icons.favorite_border_rounded,
    rightCornerWidget: Icon(Icons.notifications_none_outlined),
    hasSearch: true,
  ),
  '/profile': BottomBarInfo(
    label: 'Profile',
    iconSelected: Icons.person_rounded,
    iconUnselected: Icons.person_outline_rounded,
  ),
};
