import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/foundation.dart' show immutable;

@immutable
class CryptoCoin {
  final String symbol;
  final double price;
  final Color color;

  CryptoCoin({
    required this.symbol,
    required this.price,
  }) : color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withAlpha(50);

  factory CryptoCoin.fromJson(Map<String, dynamic> json) => CryptoCoin(
    symbol: json['symbol'],
    price: double.parse(json['priceUsd']),
  );
}
