import 'package:flutter/material.dart';
import 'package:provider_todo_list/features/todo_list/screens/main_screen/main_screen.dart';

class Routes {
  Routes._();

  static const String mainScreen = '/mainScreen';

  static final dynamic routes = <String, WidgetBuilder>{
    mainScreen: (BuildContext context) => MainScreen(),
  };
}