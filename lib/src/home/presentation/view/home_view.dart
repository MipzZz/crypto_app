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
              return Center(child: viewModel.isLoading ? CircularProgressIndicator() : Text('No coins'));
            }
            return NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification && notification.metrics.extentAfter == 0) {
                  viewModel.getCoins();
                }
                return false;
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomScrollView(
                  slivers: [
                    SliverList.builder(
                      itemCount: viewModel.coins!.length,
                      itemBuilder: (context, index) => CoinTile(
                        symbol: viewModel.coins![index].symbol,
                        price: viewModel.coins![index].price,
                        color: viewModel.coins![index].color,
                      )
                    ),
                    if (viewModel.isLoading) ...[
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      )
                    ]
                  ],
                ),
              )
            );
          },
        ),
      ),
    );
  }
}
