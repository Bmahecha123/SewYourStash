import 'package:flutter/material.dart';
import 'package:sew_your_stash/theme/theme.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: CircleAvatar(
              //child: Icon(Icons.person),
              backgroundColor: grey,
            ),
            decoration: BoxDecoration(color: Colors.teal),
          ),
          listTileTheme(
              context,
              ListTile(
                  leading: iconTheme(context, Icon(Icons.dashboard)),
                  title: Text('Dashboard'),
                  onTap: () {
                    Navigator.popAndPushNamed(context, '/');
                  })),
          listTileTheme(
              context,
              ListTile(
                leading: iconTheme(context, Icon(Icons.book)),
                title: Text('My Stash'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/stash');
                },
              )),
          listTileTheme(
              context,
              ListTile(
                leading: iconTheme(context, Icon(Icons.work)),
                title: Text('Projects'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/projects');
                },
              )),
          Divider(),
          ListTile(
            leading: iconTheme(context, iconTheme(context, Icon(Icons.person))),
            title: Text('Sign In'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
