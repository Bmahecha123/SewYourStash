import 'package:flutter/material.dart';

final Color grey = Color(0xffc5c8d1);
final Color blue = Color(0xff06749c);
final Color lightBlue = Color(0xffcce0e1);

ThemeData appTheme(BuildContext context) {
  return ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: lightBlue,
        fontFamily: 'InriaSerif',
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: grey,
          foregroundColor: blue,
        ),
        scaffoldBackgroundColor: lightBlue,
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'InriaSerif',
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