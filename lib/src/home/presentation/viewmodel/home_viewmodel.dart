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
  bool _isError = false;

  bool get isError => _isError;

  Future<void> _getCoins() async {
    final offset = _coins?.length ?? 0;
    final coinsChunk = await _coinsRepository.getCoins(offset: offset);
    _coins = UnmodifiableListView([...(_coins ?? []), ...coinsChunk]);
  }

  Future<void> getCoins() => _execute(_getCoins);

  Future<void> _execute(Future<void> Function() action) async {
    if (_isLoading) return;
    _isError = false;
    _isLoading = true;
    notifyListeners();
    try {
      await action();
    } catch (e) {
      _isError = true;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
