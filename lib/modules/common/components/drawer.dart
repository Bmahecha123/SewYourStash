import 'package:flutter/material.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text('BMahecha123@gmail.com'),
          accountName: Text('BMahecha123'),
          decoration: BoxDecoration(
            color: Colors.teal
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/');
          },
        ),
        ListTile(
          title: Text('My Stash'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/stash');
          },
        ),
        ListTile(
          title: Text('Projects'),
          onTap: () {
            Navigator.popAndPushNamed(context, '/projects');
          },
        )
      ],
    ),
  );
}