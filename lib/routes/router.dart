import 'package:app/view/pages/create_account_page.dart';
import 'package:app/view/pages/getStarted_page.dart';
import 'package:app/view/pages/indivudial_page.dart';
import 'package:app/view/pages/login_page.dart';
import 'package:app/view/pages/previous_page.dart';
import 'package:app/view/pages/searching_page.dart';
import 'package:app/view/screens/home_page.dart';
import 'package:flutter/material.dart';

class MyRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/getStarted':
        return MaterialPageRoute(builder: (context) => GetStartedPage());
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/createAccount':
        return MaterialPageRoute(builder: (context) => CreateAccountPage());
      case '/searching':
        return MaterialPageRoute(builder: (context) => SearchingPage());
      case '/previous':
        return MaterialPageRoute(builder: (context) => PreviousPage());
      case '/indivudial':
        return MaterialPageRoute(
            builder: (context) => IndivudialPage(
                  data: args as List,
                ));
      case '/':
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
