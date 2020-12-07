import 'package:api_getdata/screens/home.dart';
import 'package:flutter/material.dart';

import 'screens/characters.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case '/home': {
        return MaterialPageRoute(builder: (_) => MyHomePage());
      }
      case '/character':{
        return MaterialPageRoute(builder: (_) => CharacterScreen());
      }

    }
  }
}