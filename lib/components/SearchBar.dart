import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final Function callback;

  SearchBar({
    this.placeholder,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Icon(Icons.search_outlined),
            ),
            Text('caramba'),
            // TextField(decoration: InputDecoration(labelText: this.placeholder)),
          ],
        ),
      ),
    );
  }
}
