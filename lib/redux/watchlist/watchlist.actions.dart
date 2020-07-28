import 'package:stock_trading/model/stock.dart';

class StockSubscriptions {
  final List<Stock> subscribedStocks;

  StockSubscriptions(this.subscribedStocks);

//  AddSubscription(Stock stock) {
//    subscribedStocks.add(stock);
//  }
}

class AddStockSubscription {
  final Stock stock;

  AddStockSubscription(this.stock);
}

class RemoveStockSubscription {
  final String symbol;

  RemoveStockSubscription(this.symbol);
}