import 'package:flutter/material.dart';
import 'package:stock_trading/model/stock.dart';

class Watchlist extends StatefulWidget {
  Watchlist({ this.subscribedStocks });

  final List<Stock> subscribedStocks;

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

          return Container(
            padding: EdgeInsets.all(10),
            color: stock.trendColor,
            child: Center(
                child: Column(
                  children: <Widget>[
                    Text(stock.symbol),
                    Text(stock.currentPrice.toStringAsFixed(2)),
                  ],
                )
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 4,
        ),
      ),
    );

}
