import 'package:flutter/material.dart';
import 'package:stock_trading/model/stock.dart';

class Watchlist extends StatefulWidget {
  Watchlist({ this.subscribedStocks, this.symbolUnsubscribe });

  final List<Stock> subscribedStocks;
  final UnsubscribeCallback symbolUnsubscribe;

  @override
  _WatchlistState createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  @override
  Widget build(BuildContext context) =>
    Container(
      padding: EdgeInsets.all(20),
      color: Color(0xffEEEEEE),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.subscribedStocks != null ? widget.subscribedStocks.length : 0,
        itemBuilder: (BuildContext context, int index) {
          final Stock stock = widget.subscribedStocks[index];

          return InkWell(
            child: Container(
            padding: EdgeInsets.all(10),
            color: stock.trendColor,
            child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        stock.symbol,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ),
                    Text(
                      stock.currentPrice.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 16
                      ),
                    ),
                    CircleAvatar(
//                      decoration: ShapeDecoration(
//                        color: Color(0xff222222),
//                        shape: CircleBorder()
//                      ),
                      radius: 14,
                      backgroundColor: Color(0xff333333),
                      child: IconButton(
                        iconSize: 12,
                        icon: Icon(
                            Icons.close,
                            color: Colors.white
                        ),
                        onPressed: () => _removeStockSubscription(stock.symbol),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 4,
        ),
      ),
    );


  void _removeStockSubscription(String symbol) {
    widget.symbolUnsubscribe(symbol);

    setState(() => widget.subscribedStocks.removeWhere((s) => s.symbol == symbol));
  }

}

typedef UnsubscribeCallback = void Function(String symbol);