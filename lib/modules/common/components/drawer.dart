import 'package:flutter/material.dart';
import 'package:sew_your_stash/modules/common/services/sign_in.dart';
import 'package:sew_your_stash/theme/theme.dart';

class AppDrawer extends StatelessWidget {
  final String profileUrl;
  final String displayName;
  final String displayEmail;

  AppDrawer({this.profileUrl, this.displayName, this.displayEmail});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(displayName),
            accountEmail: Text(displayEmail),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(profileUrl)
            ),
            decoration: BoxDecoration(color: blue),
          ),
          // listTileTheme(
          //     context,
          //     ListTile(
          //         leading: iconTheme(context, Icon(Icons.dashboard)),
          //         title: Text('Dashboard'),
          //         onTap: () {
          //           Navigator.popAndPushNamed(context, '/home');
          //         })),
          listTileTheme(
              context,
              ListTile(
                leading: iconTheme(context, Icon(Icons.book)),
                title: Text('My Stash'),
                onTap: () {
                  Navigator.popAndPushNamed(context, '/stash');
                },
              )),
          // listTileTheme(
          //     context,
          //     ListTile(
          //       leading: iconTheme(context, Icon(Icons.work)),
          //       title: Text('Projects'),
          //       onTap: () {
          //         Navigator.popAndPushNamed(context, '/projects');
          //       },
          //     )),
          Divider(),
          ListTile(
            leading: iconTheme(context, iconTheme(context, Icon(Icons.person))),
            title: Text('Sign Out'),
            onTap: () {
              signOutGoogle();
              Navigator.popAndPushNamed(context, '/login');
            },
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/sewing_machine.png'),
              fit: BoxFit.cover)))
        ],
      ),
    );
  }
}
