import 'package:crypto_app/src/core/network/rest_client/rest_client_retrofit.dart';
import 'package:crypto_app/src/home/domain/entity/crypto_coin.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
final class CoinsDatasource {
  CoinsDatasource({required RetrofitClient restClient}) : _restClient = restClient;

  final RetrofitClient _restClient;

  Future<Iterable<CryptoCoin>> getCoins({required int offset, int? limit}) async {
    final response = await _restClient.getCoins(limit: limit, offset: offset);
    return response.coins;
  }
}
