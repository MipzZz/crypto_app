import 'dart:math' as math;
import 'dart:ui';

import 'package:crypto_app/src/core/utils/typedef.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'crypto_coin.g.dart';
part 'crypto_coin.freezed.dart';

@freezed
abstract class CryptoCoin with _$CryptoCoin {
  CryptoCoin._({Color? color}) : color = Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withAlpha(50);

  factory CryptoCoin({
    required String symbol,
    @JsonKey(name: 'priceUsd') required String price,
  }) = _CryptoCoin;

  @override
  final Color color;

  factory CryptoCoin.fromJson(JsonMap json) => _$CryptoCoinFromJson(json);
}
