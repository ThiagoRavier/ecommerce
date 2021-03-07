import 'package:flutter/material.dart';

Decoration purpleGradient(context) {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Theme.of(context).accentColor,
        Theme.of(context).primaryColor,
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  );
}
