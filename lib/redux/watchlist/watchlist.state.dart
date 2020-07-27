import 'package:flutter/material.dart';

class WatchlistState {
  double sliderFontSize;
  bool bold;
  bool italic;

  WatchlistState({@required this.sliderFontSize, this.bold = false, this.italic = false});

  WatchlistState.fromAppState(WatchlistState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
  }

  double get viewFontSize => sliderFontSize * 30;
}