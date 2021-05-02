import 'package:flutter/material.dart';
import 'package:mySalat/router.dart';
import 'package:mySalat/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: generateRoute,
      initialRoute: homeRoute,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Start Button
    final startButton = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xff01A0C7),
      ),
      width: size.width * 0.7,
      child: MaterialButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.pushNamed(
            context,
            loginRoute,
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/BGUser.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            height: size.height * 1,
            width: size.width * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Smart Thermometer',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                startButton,
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      registerRoute,
                    );
                  },
                  child: Text(
                    "Don't have an account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
