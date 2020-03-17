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
      child: Column(
        //padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(displayName),
            accountEmail: Text(displayEmail),
            currentAccountPicture:
                CircleAvatar(backgroundImage: NetworkImage(profileUrl)),
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
                leading: Tab(
                    icon: Image.asset(
                  'assets/thread.png',
                  height: 50,
                  width: 50,
                )
                ),
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
          // Expanded(
          //   child: Align(
          //     alignment: Alignment.bottomLeft,
          //     child: Container(
          //       margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
          //         height: 150,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage('assets/thread.png'),
          //                 fit: BoxFit.contain))
          //     ),
          //   )
          // )
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
              child: RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.popAndPushNamed(context, '/login');
                },
                highlightElevation: 0,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage('assets/pinCushion.png'),
                          height: 35.0),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ))
          // Container(
          //   height: 300,
          //   decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/sewing_machine.png'),
          //     fit: BoxFit.cover))
          // )
        ],
      ),
    );
  }
}
