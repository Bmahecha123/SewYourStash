import 'package:flutter/material.dart';
import 'package:sew_your_stash/modules/common/components/appBar.dart';
import 'package:sew_your_stash/modules/common/components/drawer.dart';

class StashPage extends StatefulWidget {
  StashPage({Key key}) : super(key: key);

  @override
  _StashPageState createState() => _StashPageState();
}

class _StashPageState extends State<StashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('My Stash', context),
      drawer: drawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Stash Page!')
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add to Stash!',
        child: Icon(Icons.create),
        onPressed: () {
          
        },
      ),
    );
  }
}