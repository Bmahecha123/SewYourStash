import 'package:flutter/material.dart';
import 'package:sew_your_stash/modules/common/components/appBar.dart';
import 'package:sew_your_stash/modules/common/components/drawer.dart';

class ProjectsPage extends StatefulWidget {
  ProjectsPage({Key key}) : super(key: key);

  @override
  _ProjectsPageState createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Projects Page', context),
      drawer: drawer(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Projects Page')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Create Project!',
        child: Icon(Icons.create),
        onPressed: () {
          
        },
      ),
    );
  }
}