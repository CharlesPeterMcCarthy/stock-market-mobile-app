import 'package:flutter/cupertino.dart';
import 'package:stock_trading/screens/home.dart';
import 'package:stock_trading/screens/watchlist.dart';

import 'constants/screen-titles.dart';

class AppNavigation {

  static Map<String, WidgetBuilder> routes = {
    '/': (BuildContext context) => HomeScreen(title: ScreenTitles.HOME_SCREEN),
    '/watchlist': (BuildContext context) => WatchlistScreen(title: ScreenTitles.WISHLIST_SCREEN)
  };

}