import 'package:stock_trading/model/stock.dart';

class WatchlistState {
  List<Stock> subscribedStocks;

  WatchlistState({this.subscribedStocks = const []});

  WatchlistState.fromAppState(WatchlistState another) {
    subscribedStocks = another.subscribedStocks;
  }
}