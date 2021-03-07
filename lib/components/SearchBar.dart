import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String placeholder;
  final Function(String) callback;

  SearchBar({
    this.placeholder,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
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
                style: TextStyle(
                  fontSize: 14,
                ),
                onChanged: this.callback,
                cursorColor: Colors.grey[700],
                decoration: InputDecoration(
                  hintText: this.placeholder,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
