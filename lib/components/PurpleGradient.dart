import 'package:flutter/material.dart';

Decoration purpleGradient(
    {BuildContext context, BorderRadius borderRadius = BorderRadius.zero}) {
  return BoxDecoration(
    borderRadius: borderRadius,
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
