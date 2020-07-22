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
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                debugPrint(snapshot.toString());
                return Text(snapshot.data == null ? 'Waiting..' : snapshot.data);
              },
            )
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


}
