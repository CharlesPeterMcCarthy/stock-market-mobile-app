import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WatchlistScreen extends StatefulWidget {
  WatchlistScreen({Key key, this.title}) : super(key: key);

  final String title;
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
                debugPrint(context.toString());
                return Text(snapshot.data == null ? 'Waiting..' : snapshot.data);
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: tickerSubscribe,
        tooltip: 'Subscribe to Ticket',
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

  void tickerSubscribe() {
    debugPrint('Subscribing to ${_controller.text}');
    if (_controller.text.isNotEmpty) widget.channel.sink.add('{"type": "subscribe", "symbol": "${_controller.text}"}');
  }

}
