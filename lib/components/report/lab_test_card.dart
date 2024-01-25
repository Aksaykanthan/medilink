import 'package:flutter/material.dart';

class LabTestCard extends StatelessWidget {
  LabTestCard({super.key});

  final DocTest = {
    "reason": "Consultation Reason",
    "name": "Dr.Shaun Murphy",
    "date": "12-05-2005",
  };
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }
}
