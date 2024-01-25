import 'package:flutter/material.dart';
import 'package:project_01/components/report/report_card.dart';

class TestReportPage extends StatelessWidget {
  const TestReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ReportCard(),
              ReportCard(),
            ],
          ),
        ),
      ),
    );
  }
}
