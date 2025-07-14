
import 'package:crypto_app/src/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'home/domain/repository/i_crypto_repository.dart';
import 'home/presentation/viewmodel/home_viewmodel.dart';
import 'injection/injection.dart';

final class AppRunner {
  const AppRunner();

  Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();

    final homeViewModel = HomeViewModel(
      coinsRepository: getIt<ICryptoRepository>(),
    );
    runApp(
      MaterialApp(
        home: HomeView(viewModel: homeViewModel),
      ),
    );
  }
}
