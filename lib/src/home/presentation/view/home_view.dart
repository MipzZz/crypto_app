import 'package:crypto_app/src/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:crypto_app/src/home/presentation/widgets/coin_tile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: viewModel,
          builder: (BuildContext context, Widget? child) {
            if (viewModel.coins?.isEmpty ?? true) {
              if (viewModel.isError) {
                return ErrorBody(retry: viewModel.getCoins);
              }
              return Center(child: viewModel.isLoading ? CircularProgressIndicator() : Text('Коины не найдены'));
            }

            return NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification && notification.metrics.extentAfter == 0 && !viewModel.isError) {
                  viewModel.getCoins();
                }
                return false;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CoinList(viewModel: viewModel),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CoinList extends StatelessWidget {

  const CoinList({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: viewModel.coins!.length,
          itemBuilder: (context, index) => CoinTile(
            symbol: viewModel.coins![index].symbol,
            price: viewModel.coins![index].price,
            color: viewModel.coins![index].color,
          ),
        ),

        /// Load
        if (viewModel.isLoading) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        ],

        /// Error
        if (viewModel.isError) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ErrorBody(retry: viewModel.getCoins),
            ),
          ),
        ],
      ],
    );
  }
}

/// {@template ErrorBody.class}
/// ErrorBody widget.
/// {@endtemplate}
class ErrorBody extends StatelessWidget {
  /// {@macro ErrorBody.class}
  const ErrorBody({super.key, required this.retry});

  final VoidCallback retry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text('Ошибка загрузки коинов'),
          TextButton(onPressed: retry, child: Text('Повторить')),
        ],
      ),
    );
  }
}

