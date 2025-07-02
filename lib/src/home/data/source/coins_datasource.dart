import 'package:crypto_app/src/core/network/rest_client/i_rest_client.dart';
import 'package:crypto_app/src/home/domain/entity/crypto_coin.dart';

final class CoinsDatasource {
  CoinsDatasource({required IRestClient restClient}) : _restClient = restClient;

  final IRestClient _restClient;

  Future<Iterable<CryptoCoin>> getCoins({required int offset, int? limit}) async {
    final response = await _restClient.get(
      '/assets',
      queryParams: {
        'offset': offset,
        'limit': limit,
      },
    );
    final coins = response?['data'] as List? ?? <Map<String, dynamic>>[];
    return coins.map((coin) => CryptoCoin.fromJson(coin));
  }
}
