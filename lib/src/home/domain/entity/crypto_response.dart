import 'package:json_annotation/json_annotation.dart';

import 'crypto_coin.dart';

part 'crypto_response.g.dart';

@JsonSerializable()
class CryptoResponse {
  @JsonKey(name: 'data')
  List<CryptoCoin> coins;
  CryptoResponse(this.coins);

  factory CryptoResponse.fromJson(Map<String, dynamic> json) => _$CryptoResponseFromJson(json);
}