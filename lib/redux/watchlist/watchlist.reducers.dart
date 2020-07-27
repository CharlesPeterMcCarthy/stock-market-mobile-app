import 'package:stock_trading/redux/watchlist/watchlist.state.dart';
import 'package:stock_trading/redux/watchlist/watchlist.actions.dart';

WatchlistState watchListReducer(WatchlistState prevState, dynamic action) {
  WatchlistState newState = WatchlistState.fromAppState(prevState);
  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }
  return newState;
}

//Reducer<List<String>> watchListReducer = combineReducers<List<String>>([
////  new TypedReducer<List<String>, FontSize>(addItemReducer),
////  new TypedReducer<List<String>, Bold>(removeItemReducer),
////  new TypedReducer<List<String>, Italic>(removeItemReducer),
//]);
