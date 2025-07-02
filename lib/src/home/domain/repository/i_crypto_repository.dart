import 'package:crypto_app/src/home/domain/entity/crypto_coin.dart';

abstract interface class ICryptoRepository {
  Future<Iterable<CryptoCoin>> getCoins({required int offset, int? limit});
}