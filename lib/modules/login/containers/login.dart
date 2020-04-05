import 'package:flutter/material.dart';
import 'package:sew_your_stash/modules/common/services/sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isButtonDisabled = false;

  @override
  void initState() {
    super.initState();

    _isButtonDisabled = true;
    isUserSignedIn().then((isUserSignedIn) {
      setState(() {
        if (isUserSignedIn)
          Navigator.pushReplacementNamed(context, '/stash');

        _isButtonDisabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _signInAndOutBtn(String text, Function fn) {
    return RaisedButton(
      onPressed: _isButtonDisabled ? null : fn,
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

  Widget _body(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/square_logo.png'),
                ),
                SizedBox(height: 50),
                _signInAndOutBtn('Sign in with Google', () {
                  setState(() {
                    _isButtonDisabled = true;
                  });
                  signInWithGoogle().then((data) {
                    setState(() {
                      Navigator.pushReplacementNamed(context, '/stash');
                    });
                  }).catchError((onError) {
                  setState(() {
                    _isButtonDisabled = false;
                  });
                  });
                }),
              ],
            ),
          ),
        ]),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.png'), fit: BoxFit.cover)),
        child: Stack(children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                    image: AssetImage('assets/square_logo.png'),
                    height: 300,
                    width: 300),
                _signInAndOutBtn('Sign in with Google', () {
                  signInWithGoogle().then((data) {
                    Navigator.popAndPushNamed(context, '/stash');
                  });
                }),
              ],
            ),
          ),
        ]),
      );
    }
  }
}
