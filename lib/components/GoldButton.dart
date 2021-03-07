import 'package:flutter/material.dart';

class GoldButton extends StatelessWidget {
  final String label;
  final Function callback;

  GoldButton({this.label, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          this.label,
        ),
      ),
    );
  }
}
