import 'dart:ui';
import 'package:flutter/material.dart';

class Stock {

  String symbol;
  double currentPrice = 0;
  double previousPrice = 0;
  Color trendColor = Colors.white;

  Stock(String symbol, double price) {
    this.symbol = symbol;
    this.currentPrice = price;
  }

  void setPrice(double price) {
    previousPrice = currentPrice;
    currentPrice = price;
    setStockTrendColor();
  }

  Color setStockTrendColor() {
    print("PRICES");
    print(currentPrice);
    print(previousPrice);
    if (currentPrice < previousPrice) return trendColor = Colors.red;
    if (currentPrice > previousPrice) return trendColor = Colors.green;
    return trendColor;
  }

}