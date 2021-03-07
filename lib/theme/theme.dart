import 'package:flutter/material.dart';

const yellow = Color(0xffE7B944);
const purpleLight = Color(0xff845FA1);
const purpleDark = Color(0xff34283E);
const gray = Color(0xff9B9B9B);
const grayLight = Color(0xffE1E1E1);
const backgroundColor = Color(0xffF4F3F4);

ThemeData myAppTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
      textTheme: base.textTheme.copyWith(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        bodyText2: TextStyle(fontSize: 14, color: Colors.black),
      ),
      backgroundColor: Colors.white,
      primaryColor: purpleLight,
      accentColor: purpleDark,
      scaffoldBackgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: gray,
        size: 25.0,
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: yellow,
        shape: RoundedRectangleBorder(),
        textTheme: ButtonTextTheme.primary,
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: Colors.deepPurple[300],
        overlayColor: Colors.deepPurple[300].withAlpha(32),
        thumbColor: Colors.deepPurple[300],
      ),
      cardTheme: CardTheme(color: Colors.pink[50]),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: purpleLight,
        unselectedItemColor: gray,
      )
      // elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
      //     backgroundColor:
      //         MaterialStateColor.resolveWith((Set<MaterialState> states) {
      //   if (states.contains(MaterialState.pressed)) return Colors.pink[300];
      //   return null; // Use the component's default.
      // }))),
      );
}
