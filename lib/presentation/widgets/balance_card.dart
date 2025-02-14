import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  final String label;
  final double balance;

  BalanceCard({required this.label, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("\$${balance.toStringAsFixed(2)}", style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
