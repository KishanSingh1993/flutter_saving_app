import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/savings_bloc.dart';
import '../bloc/savings_state.dart';
import '../widgets/balance_card.dart';
import 'savings_entry_screen.dart';
import 'withdrawal_screen.dart';
import 'history_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Savings App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            BlocBuilder<SavingsBloc, SavingsState>(
              builder: (context, state) {
                double compA = 0;
                double compB = 0;
                if (state is SavingsLoaded) {
                  compA = state.compA;
                  compB = state.compB;
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BalanceCard(label: "CompA", balance: compA),
                    SizedBox(width: 16),
                    BalanceCard(label: "CompB", balance: compB),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SavingsEntryScreen())),
              child: Text("Enter Savings"),
            ),
            SizedBox(height: 10),  // Added space
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WithdrawalScreen())),
              child: Text("Withdraw"),
            ),
            SizedBox(height: 10),  // Added space
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen())),
              child: Text("View History"),
            ),
          ],
        ),
      ),
    );
  }
}
