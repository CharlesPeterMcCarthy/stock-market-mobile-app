import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stock_trading/components/watchlist.dart';
import 'package:stock_trading/model/stock.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WatchlistScreen extends StatefulWidget {
  WatchlistScreen({Key key, this.title}) : super(key: key);

  final String title;
  List<Stock> subscribedStocks = [];
  final WebSocketChannel channel = IOWebSocketChannel.connect('wss://ws.finnhub.io?token=bs9btlfrh5rahoaofigg');

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    widget.channel.stream.listen((onData){
      debugPrint("INIT REVIEve");
      debugPrint(onData);
      Map<String, dynamic> data = jsonDecode(onData);
      print(data);
      _sortSubscriptionSnapshot(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Watchlist screen'),
            Watchlist(subscribedStocks: widget.subscribedStocks),
            Form(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(labelText: 'Stock Ticker'),
              ),
            ),
//            StreamBuilder(
//              stream: widget.channel.stream,
//              builder: (context, snapshot) {
//                debugPrint(snapshot.toString());
////                _updateStockPrice();
//                return Text('');
//              },
//            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _symbolSubscribe,
        tooltip: 'Subscribe to Ticker',
        child: Icon(Icons.send),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('Closing subscriptions');

    widget.channel.sink.close();
    super.dispose();
  }

  void _symbolSubscribe() {
    final String symbol = _controller.text.toUpperCase();
    _controller.text = '';

    if (_checkSymbolAlreadySubscribed(symbol)) {
      _showAlreadySubscribedDialog(symbol);
      return;
    }

    debugPrint('Subscribing to $symbol');

    if (symbol.isNotEmpty) {
      widget.channel.sink.add('{"type": "subscribe", "symbol": "$symbol"}');

      final stock = Stock(symbol, 0);
      setState(() => widget.subscribedStocks.add(stock));
    }
  }

  bool _checkSymbolAlreadySubscribed(String symbol) {
    return widget.subscribedStocks.indexWhere((s) => s.symbol == symbol) >= 0;
  }

  void _showAlreadySubscribedDialog(String symbol) {
    debugPrint('Already subscribed to $symbol');

    showDialog(
      context: context,
      builder: (BuildContext context) =>
        AlertDialog(
          title: Text('Already Subscribed'),
          content: Text('You have already subscribed to $symbol'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
    );
  }

  void _sortSubscriptionSnapshot(Map snapshotData) {
//    debugPrint(snapshot.toString());

//    if (snapshot.hasData) {
//      Map<String, dynamic> snapshotData = jsonDecode(snapshot.data);
      final String type = snapshotData['type'];

      if (type == 'trade' && snapshotData.containsKey('data')) {
        dynamic data = snapshotData['data'];
        double price = data[0]['p'].toDouble();
        String symbol = data[0]['s'];

        final stock = widget.subscribedStocks.firstWhere((s) => s.symbol == symbol);

        setState(() {
          stock.price = price;
        });
      }
//    }
  }

  Future<void> _updateStockPrice() async {
    if (widget.subscribedStocks.length == 0) return;
    () async {
      setState(() {
        widget.subscribedStocks[0].price = 1.5;
      });
    }();
  }

}
