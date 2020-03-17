import 'package:flutter/material.dart';

final Color grey = Color(0xffc5c8d1);
final Color blue = Color(0xff06749c);
final Color lightBlue = Color(0xffcce0e1);
final Color yellow = Color(0xfff1d953);
final Color orange = Color(0xfff79980);
final Color beige = Color(0xfff0d4d0);

final Color backgroundColor = yellow;
final Color buttonBackgroundColor = orange;
final Color buttonForegroundColor = blue;

ThemeData appTheme(BuildContext context) {
  return ThemeData(
        brightness: Brightness.light,
        primaryColor: blue,
        canvasColor: lightBlue,
        fontFamily: 'InriaSerif',
        buttonTheme: ButtonThemeData(
          alignedDropdown: true,
          buttonColor: yellow,
          splashColor: beige,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: yellow,
          foregroundColor: buttonForegroundColor,
        ),
        scaffoldBackgroundColor: lightBlue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'InriaSerif',
          //fontSizeDelta: 5,
        ),
        dialogTheme: DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
          backgroundColor: lightBlue
        ),
        typography: Typography(
          black: Typography.blackMountainView,
          white: Typography.whiteMountainView,
          dense: Typography.dense2018,
          englishLike: Typography.englishLike2018,
          tall: Typography.tall2018)
      );
}

ListTileTheme listTileTheme(BuildContext context, Widget child) => ListTileTheme(
  iconColor: grey,
  child: child,
);

IconTheme iconTheme(BuildContext context, Widget child) => IconTheme(
  child: child,
  data: IconThemeData(
    color: blue,
  ),
);

TextStyle headerFontStyle() {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

TextStyle itemFontStyle() {
  return TextStyle(fontSize: 20);
}