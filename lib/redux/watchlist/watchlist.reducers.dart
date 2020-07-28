import 'package:stock_trading/model/stock.dart';
import 'package:stock_trading/redux/watchlist/watchlist.state.dart';
import 'package:stock_trading/redux/watchlist/watchlist.actions.dart';

WatchlistState watchListReducer(WatchlistState prevState, dynamic action) {
  WatchlistState newState = WatchlistState.fromAppState(prevState);

  if (action is StockSubscriptions) {
    newState.subscribedStocks = action.subscribedStocks;
  } else if (action is AddStockSubscription) {
    newState.subscribedStocks = addStockSub(prevState.subscribedStocks, action);
  } else if (action is RemoveStockSubscription) {
    newState.subscribedStocks = removeStockSub(prevState.subscribedStocks, action);
  } else if (action is UpdateStockPrice) {
    newState.subscribedStocks = updateStockPrice(prevState.subscribedStocks, action);
  }

  return newState;
}

List<Stock> addStockSub(List<Stock> currentSubs, AddStockSubscription action) => List.from(currentSubs)..add(action.stock);

List<Stock> removeStockSub(List<Stock> currentSubs, RemoveStockSubscription action) => List.from(currentSubs)..removeWhere((s) => s.symbol == action.symbol);

List<Stock> updateStockPrice(List<Stock> currentSubs, UpdateStockPrice action) => List.from(currentSubs)..firstWhere((s) => s.symbol == action.symbol, orElse: null).setPrice(action.price);

//Reducer<List<String>> watchListReducer = combineReducers<List<String>>([
////  new TypedReducer<List<String>, FontSize>(addItemReducer),
////  new TypedReducer<List<String>, Bold>(removeItemReducer),
////  new TypedReducer<List<String>, Italic>(removeItemReducer),
//]);
