import 'package:stock_trading/redux/watchlist/watchlist.reducers.dart';

class AppState {
  final List<String> items;
  final String searchQuery;

  AppState(this.items, this.searchQuery);
}

//AppState appStateReducer(AppState state, action) => new AppState(
////    watchListReducer(state.items, action),
//);
