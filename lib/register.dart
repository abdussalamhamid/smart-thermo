import 'package:flutter/material.dart';
import 'package:mySalat/routes.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

    final confirmPassword = TextField(
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
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
          Navigator.popAndPushNamed(
            context,
            loginRoute,
          );
        },
        child: Text(
          "Register",
          textAlign: TextAlign.center,
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.indigo[400],
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Colors.white,
                  ),
                  child: confirmPassword,
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
