
import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<Map<String, dynamic>> history;

  const HistoryList({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (context, index) {
        final entry = history[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          elevation: 3,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            title: Text("Year ${entry['year']}"),
            subtitle: Text("Savings: \$${entry['savings']} | Withdrawn: \$${entry['withdrawn']}"),
          ),
        );
      },
    );
  }
}
