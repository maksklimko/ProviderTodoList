import 'package:flutter/material.dart';
import 'package:provider_todo_list/features/todo_list/screens/create_item_screen/create_item_screen.dart';

class Routes {
  Routes._();

  static const String createItemScreen = '/createItem';

  static final dynamic routes = <String, WidgetBuilder>{
    createItemScreen: (BuildContext context) => CreateItemScreen(),
  };
}