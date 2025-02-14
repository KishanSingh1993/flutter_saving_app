import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/savings_bloc.dart';
import '../bloc/savings_event.dart';

class SavingsEntryScreen extends StatefulWidget {
  @override
  _SavingsEntryScreenState createState() => _SavingsEntryScreenState();
}

class _SavingsEntryScreenState extends State<SavingsEntryScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitSavings() {
    final double savings = double.tryParse(_controller.text) ?? 0;
    if (savings > 0) {
      BlocProvider.of<SavingsBloc>(context).add(AddSavingsEvent(savings));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Savings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter Annual Savings'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitSavings,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
