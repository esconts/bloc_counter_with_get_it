import 'package:bloc_counter_from_scratch/screens/first_screen.dart';
import 'package:bloc_counter_from_scratch/screens/second_screen.dart';
import 'package:bloc_counter_from_scratch/screens/third_screen.dart';
import 'package:flutter/material.dart';


class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => FirstScreen(
             title: 'FIRST SCREEN',
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(
            title: 'SECOND SCREEN',
            color: Colors.redAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(
            title: 'THIRD SCREEN',
            color: Colors.orangeAccent,
          ),
        );
    }
  }
}
