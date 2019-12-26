import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sew_your_stash/routes/routes.dart';
import 'package:sew_your_stash/theme/theme.dart';

void main() {
    FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) 
      exit(1);
    };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sew Your Stash',
      theme: appTheme(context),
      initialRoute: '/',
      routes: routes(),
    );
  }
}
