import 'package:flutter/material.dart';
import 'navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Trading',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: AppNavigation.routes,
    );
  }
}

