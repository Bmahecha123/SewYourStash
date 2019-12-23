import 'package:flutter/material.dart';
import 'package:sew_your_stash/modules/home/containers/home.dart';
import 'package:sew_your_stash/modules/projects/containers/projects.dart';
import 'package:sew_your_stash/modules/stash/containers/stash.dart';

Map<String, WidgetBuilder> routes() => <String, WidgetBuilder> {
  '/': (BuildContext context) => HomePage(),
  '/stash': (BuildContext context) => StashPage(),
  '/projects': (BuildContext context) => ProjectsPage()
};