import 'package:flutter/material.dart';
import 'package:stock_trading/screens/home.dart';

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
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => MyHomePage(title: 'Stock Trading'),
        '/watchlist': (BuildContext context) => MyHomePage(title: 'My Watchlist')
      },
    );
  }
}

