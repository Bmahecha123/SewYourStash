import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Color(0xffcce0e1),
        fontFamily: 'InriaSerif',
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xffc5c8d1),
          foregroundColor: Color(0xff06749c),
          
        ),
        scaffoldBackgroundColor: Color(0xffcce0e1),
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