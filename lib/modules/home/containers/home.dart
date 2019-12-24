import 'package:flutter/material.dart';
import 'package:sew_your_stash/modules/common/components/appBar.dart';
import 'package:sew_your_stash/modules/common/components/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Home', context),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Home Page'),
      )
    );
  }
}