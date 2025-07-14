import 'package:freezed_annotation/freezed_annotation.dart';

import 'crypto_coin.dart';

part 'crypto_response.g.dart';
part 'crypto_response.freezed.dart';

@freezed
abstract class CryptoResponse with _$CryptoResponse {
  const factory CryptoResponse({
    @JsonKey(name: 'data')
    required List<CryptoCoin> coins,
  }) = _CryptoResponse;

  factory CryptoResponse.fromJson(Map<String, dynamic> json) => _$CryptoResponseFromJson(json);
}
