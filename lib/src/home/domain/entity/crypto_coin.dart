import 'dart:math' as math;
import 'dart:ui';

import 'package:crypto_app/src/core/utils/typedef.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:json_annotation/json_annotation.dart';

part 'crypto_coin.g.dart';

@immutable
@JsonSerializable()
class CryptoCoin {
  final String symbol;
  @JsonKey(name: 'priceUsd')
  final String price;
  final Color color;

  CryptoCoin({
    required this.symbol,
    required this.price,
  }) : color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withAlpha(50);

  factory CryptoCoin.fromJson(JsonMap json) => _$CryptoCoinFromJson(json);
}
