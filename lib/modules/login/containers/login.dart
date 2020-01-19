import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sew_your_stash/models/branding.dart';
import 'package:sew_your_stash/models/stash.dart';
import 'package:sew_your_stash/models/stashItem.dart';
import 'package:sew_your_stash/modules/common/services/stashService.dart';
import 'package:sew_your_stash/services/sign_in.dart';
import 'package:sew_your_stash/theme/theme.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(size: 150),
            SizedBox(height: 50),
            _signInAndOutBtn('Sign in with Google', () {
              signInWithGoogle().then((data) {
                //TODO ADD SERVICE METHOD TO GRAB USER IN DB
                Navigator.popAndPushNamed(context, '/home');
              });
            }),
            SizedBox(height: 50),
            Text(
              'Not a member?', 
              style: TextStyle(fontSize: 20.0),
            ),
            _signInAndOutBtn('Sign up with Google', () {
              signInWithGoogle().then((data) {
                //TODO ADD SERVICE METHOD TO REGISTER USER IN DB
                Navigator.popAndPushNamed(context, '/home');
              });
            }),
            RaisedButton(onPressed: () {
              //createStash('tester');
              // List<Map<String, dynamic>> newItems = [
              //   StashItem(
              //     type: 'fabriccc', 
              //     subType: 'subType', 
              //     weight: '10pz', 
              //     fiberContent: {'test': 33},
              //     width: 34,
              //     intendedUse: 'projects',
              //     branding: Branding(brand: 'brian', designer: 'test'),
              //     tags: ['cloth', 'tester'],
              //     yardageTotal: 34).toJson(),
              // ];
              
              // updateStash('tester', newItems);
              getStash('tester')
                .then((data) {
                  Stash stash = Stash.fromSnapshot(data);
                  Map<String, dynamic> mappp = data.data;
                  List mapData = List.from(mappp['stashItems']);
                  StashItem stashItem = StashItem.fromJson(mapData[0]);
                  log(stashItem.subType);
                }).catchError((e) {
                  log(e.toString());
                });
            }, child: Text('Test add stuff'),)
          ],
        ),
      ),
    );
  }

  Widget _signInAndOutBtn(String text, Function fn) {
    return OutlineButton(
      splashColor: blue,
      onPressed: fn,
      highlightElevation: 0,
      highlightedBorderColor: grey,
      borderSide: BorderSide(color: grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
