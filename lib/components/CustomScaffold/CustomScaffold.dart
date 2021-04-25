import 'SearchBar.dart';
import 'package:ecommerce/routes.dart';
import 'CustomBottomBarNavigator.dart';
import 'GradientAppBar.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatefulWidget {
  final BottomBarInfo appBarInfo;
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            widget.appBar ??
                GradientAppBar(
                  title: widget.appBarInfo.label,
                  leftCornerWidget: widget.appBarInfo.leftCornerWidget,
                  rightCornerWidget: widget.appBarInfo.rightCornerWidget,
                  searchBar: widget.appBarInfo.hasSearch
                      ? SearchBar(
                          callback: (String input) {
                            setState(() {
                              searchTerm = input;
                            });
                          },
                          placeholder: widget.appBarInfo.searchPlaceholder,
                        )
                      : null,
                ),
            if (widget.appBar == null &&
                (widget.appBarInfo != null && widget.appBarInfo.hasSearch))
              SizedBox(height: 22),
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
      bottomNavigationBar: widget.bottomNavigationBar != null
          ? UnconstrainedBox(
              child: widget.bottomNavigationBar,
            )
          : CustomBottomBarNavigator(),
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
