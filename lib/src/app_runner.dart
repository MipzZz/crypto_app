
import 'package:crypto_app/src/core/network/rest_client/dio_configurator.dart';
import 'package:crypto_app/src/core/network/rest_client/rest_client_dio.dart';
import 'package:crypto_app/src/core/network/url.dart';
import 'package:crypto_app/src/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';

import 'home/data/repository/crypto_repository.dart';
import 'home/data/source/coins_datasource.dart';
import 'home/presentation/viewmodel/home_viewmodel.dart';

final class AppRunner {
  const AppRunner();

  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// В рамках примера не стал реализовывать отдельный DI контейнер
    final dio = AppDioConfigurator().create(url: Url.baseUrl);
    final dioClient = RestClientDio(dio: dio);
    final coinsDatasource = CoinsDatasource(restClient: dioClient);
    final homeViewModel = HomeViewModel(
      coinsRepository: CryptoRepository(coinsDatasource: coinsDatasource),
    );
    runApp(
      MaterialApp(
        home: HomeView(viewModel: homeViewModel),
      ),
    );
  }
}
