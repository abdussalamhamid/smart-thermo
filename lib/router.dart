import 'package:flutter/material.dart';
import 'package:mySalat/main.dart';
import 'package:mySalat/login.dart';
import 'package:mySalat/user_menu.dart';
import 'package:mySalat/register.dart';

import 'package:mySalat/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (context) => MyHomePage());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case userMenuRoute:
      return MaterialPageRoute(builder: (context) => UserMenu());
    case registerRoute:
      return MaterialPageRoute(builder: (context) => RegisterPage());
    default:
      return MaterialPageRoute(builder: (context) => MyHomePage());
  }
}
