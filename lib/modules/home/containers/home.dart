import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sew_your_stash/models/branding.dart';
import 'package:sew_your_stash/models/fabric.dart';
import 'package:sew_your_stash/models/project.dart';
import 'package:sew_your_stash/modules/common/components/appBar.dart';
import 'package:sew_your_stash/modules/common/components/drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Project> _projects = [];
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  bool _isLoading = false;

  @override
  initState() {
    super.initState();

    fetchProjects();
  }

  Future<dynamic> fetchProjects() {
    _isLoading = true;
    String url = 'http://localhost:3000/data';

    return http
      .get(url)
      .then((http.Response response) {
        final List<Project> fetchedProjects = [];

        final List<dynamic> projectsData = json.decode(response.body);

        if (projectsData == null) {
          setState(() {
            _isLoading = false;
          });
        }
        
        for (var i = 0; i < projectsData.length; i++) {
          List<dynamic> fabricsData = projectsData[i]['fabric'];
          List<Fabric> fabrics = [];

          fabricsData.forEach((fabric) => {
            fabrics.add(Fabric.fromJson(fabric))
          });

          final Project project = Project(
            name: projectsData[i]['name'],
            description: projectsData[i]['description'],
            fabric: fabrics);
            
            fetchedProjects.add(project);
        }

        setState(() {
          _projects = fetchedProjects;
          _isLoading = false;
        });
      }).catchError((Object error) {
        setState(() {
          _isLoading = false;
        });
      });
  }

  Widget _buildProjectList() {
    return RefreshIndicator(
      onRefresh: () => fetchProjects(),
      key: _refreshIndicatorKey,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Padding(
                child: ListTile(
                  title: Text(_projects[index].name),
                  subtitle: Text(_projects[index].description),
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Divider(
                height: 5.0,
              )
            ],
          );
        },
        itemCount: _projects.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Home', context),
      drawer: AppDrawer(),
      body: _isLoading ? Center(
        child: CircularProgressIndicator(),
      ) 
      : _buildProjectList(),
    );
  }
}