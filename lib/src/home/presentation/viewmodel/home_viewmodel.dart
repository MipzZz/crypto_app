import 'dart:collection';

import 'package:crypto_app/src/home/domain/entity/crypto_coin.dart';
import 'package:crypto_app/src/home/domain/repository/i_crypto_repository.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required ICryptoRepository coinsRepository}) : _coinsRepository = coinsRepository {
    getCoins();
  }

  final ICryptoRepository _coinsRepository;

  UnmodifiableListView<CryptoCoin>? _coins;
  UnmodifiableListView<CryptoCoin>? get coins => _coins;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getCoins() async {
    if (_isLoading) return;
    _isLoading = true;
    notifyListeners();
    final offset = _coins?.length ?? 0;
    try {
      final coinsChunk = await _coinsRepository.getCoins(offset: offset);
      _coins = UnmodifiableListView([...(_coins ?? []), ...coinsChunk]);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
    }
    notifyListeners();
  }
}
