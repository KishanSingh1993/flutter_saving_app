import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/savings_bloc.dart';
import '../bloc/savings_event.dart';
import '../bloc/savings_state.dart';

class WithdrawalScreen extends StatefulWidget {
  @override
  _WithdrawalScreenState createState() => _WithdrawalScreenState();
}

class _WithdrawalScreenState extends State<WithdrawalScreen> {
  final TextEditingController _controller = TextEditingController();
  String _selectedComponent = "CompA";

  void _withdraw() {
    final double amount = double.tryParse(_controller.text) ?? 0;
    if (amount > 0) {
      context
          .read<SavingsBloc>()
          .add(WithdrawSavingsEvent(amount, _selectedComponent));
    }
  }

  void _showErrorPopup(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Withdraw Funds')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: _selectedComponent,
              items: ["CompA", "CompB"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedComponent = newValue!;
                });
              },
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Withdrawal Amount'),
            ),
            SizedBox(height: 20),
            BlocListener<SavingsBloc, SavingsState>(
              listener: (context, state) {
                if (state is SavingsError) {
                  _showErrorPopup(state.message);
                } else if (state is SavingsLoaded) {
                  Navigator.pop(context); // Close screen on success
                }
              },
              child: ElevatedButton(
                onPressed: _withdraw,
                child: Text('Withdraw'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
