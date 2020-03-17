import 'package:flutter/material.dart';
import 'package:sew_your_stash/modules/common/services/sign_in.dart';
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: [
      //   Padding(padding: EdgeInsets.all(10.0),
      //   child: Align(
      //     alignment: Alignment.topLeft,
      //     child: Image(
      //       image: AssetImage('assets/background.png'),
      //     ),
      //   ),
      // ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage('assets/square_logo.png'),),
              SizedBox(height: 50),
              _signInAndOutBtn('Sign in with Google', () {
                signInWithGoogle().then((data) {
                  //TODO ADD SERVICE METHOD TO GRAB USER IN DB
                  Navigator.popAndPushNamed(context, '/stash');
                });
              }),
            ],
          ),
        ),
      ]
      ),
      )
    );
  }

  Widget _signInAndOutBtn(String text, Function fn) {
    return RaisedButton(
      onPressed: fn,
      highlightElevation: 0,
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
