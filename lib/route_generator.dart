import 'package:flutter/material.dart';
import 'package:flutter_functions/main.dart';
import 'package:flutter_functions/mod_rest_overview.dart';
import 'package:flutter_functions/mod_rest_detail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    switch (settings.name) {

      case '/':
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case '/rest-overview':
        return MaterialPageRoute(builder: (context) =>  RestOverview());

      case '/rest-detail':
        if (settings.arguments != null)
        {
          return MaterialPageRoute(builder: (context) =>  RestDetail());
        }
        else {
          return _errorRoute();
        }

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
