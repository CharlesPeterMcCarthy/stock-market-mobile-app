import 'package:redux/redux.dart';
import 'package:stock_trading/redux/watchlist/watchlist.reducers.dart';
import 'package:stock_trading/redux/watchlist/watchlist.state.dart';

final _initialState = WatchlistState();
final Store<WatchlistState> store = Store<WatchlistState>(watchListReducer, initialState: _initialState);
