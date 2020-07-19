import 'package:flutter/material.dart';

class WatchlistScreen extends StatefulWidget {
  WatchlistScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WatchlistScreenState createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Watchlist screen'),
          ],
        ),
      ),
    );
  }
}
