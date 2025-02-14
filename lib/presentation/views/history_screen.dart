import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/savings_bloc.dart';
import '../bloc/savings_state.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transaction History")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SavingsBloc, SavingsState>(
          builder: (context, state) {
            if (state is SavingsLoaded && state.history.isNotEmpty) {
              return ListView.builder(
                itemCount: state.history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.history[index]),
                  );
                },
              );
            }
            return Center(child: Text("No history yet"));
          },
        ),
      ),
    );
  }
}
