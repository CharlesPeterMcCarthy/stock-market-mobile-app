import 'dart:ui';
import 'package:flutter/material.dart';

class Stock {

  String symbol;
  double currentPrice = 0;
  double previousPrice = 0;
  Color trendColor = Colors.white;

  Stock(this.symbol, this.currentPrice);

  void setPrice(double price) {
    previousPrice = currentPrice;
    currentPrice = price;
    setStockTrendColor();
  }

  Color setStockTrendColor() {
    if (currentPrice < previousPrice) return trendColor = Colors.red;
    if (currentPrice > previousPrice) return trendColor = Colors.green;
    return trendColor;
  }

}