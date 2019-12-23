import 'package:flutter/material.dart';

AppBar appBar(String title, BuildContext context) => AppBar(
  title: Text(
    title, 
    //style: Theme.of(context).textTheme.display1,
  ),
);