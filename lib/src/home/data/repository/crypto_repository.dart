import 'package:crypto_app/src/home/data/source/coins_datasource.dart';
import 'package:crypto_app/src/home/domain/entity/crypto_coin.dart';
import 'package:crypto_app/src/home/domain/repository/i_crypto_repository.dart';

class CryptoRepository implements ICryptoRepository {
  CryptoRepository({required CoinsDatasource coinsDatasource}) : _coinsDatasource = coinsDatasource;

  final CoinsDatasource _coinsDatasource;

  @override
  Future<Iterable<CryptoCoin>> getCoins({required int offset, int? limit = 15}) async{
    final coins = await _coinsDatasource.getCoins(offset: offset, limit: limit);
    return coins;
  }
}
