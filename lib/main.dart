import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:stock_trading/redux/watchlist/watchlist.state.dart';
import 'package:stock_trading/store.dart';
import 'constants/screen-titles.dart';
import 'navigation.dart';
import 'package:redux/redux.dart';

//List<Middleware<WatchlistState>> createStoreMiddleware() => [
//  TypedMiddleware<WatchlistState, SaveListAction>(_saveList),
//];

void main() {
  runApp(TradingApp(store: store));
}

class TradingApp extends StatelessWidget {
  final Store<WatchlistState> store;

  TradingApp({ this.store });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<WatchlistState>(
      store: store,
      child: MaterialApp(
        title: ScreenTitles.HOME_SCREEN,
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: AppNavigation.routes,
      ),
    );
  }
}

