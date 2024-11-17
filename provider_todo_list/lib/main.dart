import 'package:flutter/material.dart';
import 'package:provider_todo_list/common/theme/app_theme.dart';
import 'package:provider_todo_list/routes.dart';

import 'features/todo_list/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      initialRoute: '/',
      routes: Routes.routes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const MainScreen(),
    );
  }
}
