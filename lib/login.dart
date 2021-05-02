import 'package:flutter/material.dart';
import 'package:mySalat/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          )),
    );

    final passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.pushNamed(
            context,
            userMenuRoute,
          );
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xff0a5f69),
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          //decoration: BoxDecoration(color: Color(0xff0a5f69)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/user.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                  ),
                  child: emailField,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                  ),
                  child: passwordField,
                ),
                loginButon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
