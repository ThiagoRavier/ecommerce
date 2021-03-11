import 'package:flutter/material.dart';

const yellowDark = Color(0xFFC0972F);
const yellow = Color(0xffE7B944);
const purpleLight = Color(0xff845FA1);
const purpleDark = Color(0xff34283E);
const gray = Color(0xff9B9B9B);
const grayLight = Color(0xffE1E1E1);
const red = Color(0xffCE3E3E);
const backgroundColor = Color(0xffF4F3F4);
const shadowColor = Color.fromRGBO(0, 0, 0, 0.05);
BorderRadius defaultRadius = BorderRadius.circular(8.0);
BoxShadow defaultShadow = BoxShadow(
  color: shadowColor,
  offset: Offset(0, 5),
  blurRadius: 15,
);

ThemeData myAppTheme() {
  return ThemeData(
    fontFamily: 'SFProDisplay',
    textTheme: TextTheme(
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
      subtitle1:
          TextStyle(fontSize: 14, color: Colors.black), // Dropdown Button
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
      splashColor: yellowDark,
      shape: RoundedRectangleBorder(),
      textTheme: ButtonTextTheme.primary,
      alignedDropdown: true,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: Colors.deepPurple[300],
      overlayColor: Colors.deepPurple[300].withAlpha(32),
      thumbColor: Colors.deepPurple[300],
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shadowColor: shadowColor,
      elevation: 3,
      clipBehavior: Clip.hardEdge,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: purpleLight,
      unselectedItemColor: gray,
    ),
    buttonColor: yellow,
    dividerColor: grayLight,
    disabledColor: gray,
    highlightColor: red,
    // elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(
    //     backgroundColor:
    //         MaterialStateColor.resolveWith((Set<MaterialState> states) {
    //   if (states.contains(MaterialState.pressed)) return Colors.pink[300];
    //   return null; // Use the component's default.
    // }))),
  );
}
