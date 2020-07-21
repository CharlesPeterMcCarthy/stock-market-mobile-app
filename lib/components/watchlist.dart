import 'package:flutter/material.dart';

class Watchlist extends StatefulWidget {
  Watchlist({ this.subscribedStocks });

  final List<String> subscribedStocks;

  @override
  _WatchlistState createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
  @override
  Widget build(BuildContext context) =>
    Container(
      padding: EdgeInsets.all(20),
      color: Colors.grey,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.subscribedStocks != null ? widget.subscribedStocks.length : 0,
        itemBuilder: (BuildContext context, int index) =>
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.green,
            child: Center(
              child: Text(widget.subscribedStocks[index]),
            ),
          ),
        separatorBuilder: (BuildContext context, int index) => Divider(
          height: 4,
        ),
      ),
    );

}
