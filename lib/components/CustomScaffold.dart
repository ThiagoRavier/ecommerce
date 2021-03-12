import 'package:ecommerce/components/SearchBar.dart';
import 'package:ecommerce/routes.dart';
import 'package:ecommerce/screens/AppNavigator/components/CustomBottomBarNavigator.dart';
import 'package:ecommerce/screens/AppNavigator/components/GradientAppBar.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final ScreenInfo appBarInfo;
  final Widget body;
  final Widget bottomNavigationBar;
  final Widget appBar;
  final EdgeInsetsGeometry padding;

  const CustomScaffold({
    @required this.body,
    Key key,
    this.bottomNavigationBar,
    this.appBar,
    this.padding,
    this.appBarInfo,
  }) : super(key: key);

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    print(widget.appBarInfo);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.appBar ??
                GradientAppBar(
                  title: widget.appBarInfo.label,
                  searchBar: SearchBar(
                    callback: (String input) {
                      setState(() {
                        searchTerm = input;
                      });
                    },
                    placeholder: widget.appBarInfo.searchPlaceholder,
                  ),
                ),
            Padding(
              padding: widget.padding ?? EdgeInsets.all(0),
              child: SearchTermProvider(
                child: widget.body,
                searchTerm: searchTerm,
                clearSearch: () => setState(() => searchTerm = ''),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          widget.bottomNavigationBar ?? CustomBottomBarNavigator(),
    );
  }
}

class SearchTermProvider extends InheritedWidget {
  final Widget child;
  final String searchTerm;
  final bool Function(String) searchIncludes;
  final void Function() clearSearch;

  SearchTermProvider({Key key, this.child, this.searchTerm, this.clearSearch})
      : searchIncludes = ((String value) =>
            RegExp(searchTerm, caseSensitive: false).hasMatch(value)),
        super(key: key, child: child);

  static SearchTermProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SearchTermProvider>();
  }

  @override
  bool updateShouldNotify(SearchTermProvider oldWidget) {
    return oldWidget.searchTerm != searchTerm;
  }
}

bool Function(String) getSearchFunction(BuildContext ctx) =>
    ctx.dependOnInheritedWidgetOfExactType<SearchTermProvider>().searchIncludes;

bool Function() getClearSearchFunction(BuildContext ctx) =>
    ctx.dependOnInheritedWidgetOfExactType<SearchTermProvider>().clearSearch;
