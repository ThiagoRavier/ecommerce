import 'package:ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final Function(String) callback;

  SearchBar({
    this.placeholder = 'O que você está procurando?',
    this.callback,
  });

  final FocusNode focusNode = FocusNode();

  void setFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setFocus(context);
      },
      child: Container(
        height: 44,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          boxShadow: [defaultShadow],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 8.0),
              child: Icon(Icons.search_outlined),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: TextField(
                  focusNode: focusNode,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                  onChanged: callback,
                  cursorColor: Colors.grey[700],
                  decoration: InputDecoration(
                    hintText: placeholder,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
