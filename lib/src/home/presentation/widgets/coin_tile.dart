import 'package:crypto_app/src/core/theme/fonts.dart';
import 'package:flutter/material.dart';

class CoinTile extends StatelessWidget {
  const CoinTile({
    super.key,
    required this.symbol,
    required this.price,
    required this.color,
  });

  final String symbol;
  final double price;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(fontSize: 17, fontFamily: Fonts.sf, color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            LeadSquare(color: color),
            SizedBox(width: 16),
            Text(symbol),
            Spacer(),
            Text('\$${price.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}

/// {@template LeadSquare.class}
/// LeadSquare widget.
/// {@endtemplate}
class LeadSquare extends StatelessWidget {
  /// {@macro LeadSquare.class}
  const LeadSquare({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }
}
