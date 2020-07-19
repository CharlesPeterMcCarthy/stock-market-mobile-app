import 'package:flutter/cupertino.dart';
import 'package:stock_trading/screens/home.dart';

class AppNavigation {

  static Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => MyHomePage(title: 'Stock Trading'),
  '/watchlist': (BuildContext context) => MyHomePage(title: 'My Watchlist')
  };

}