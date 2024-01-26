import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        title: const Text("Notification"),
      ),
      body: const Center(
          child: Text(
        "Notification",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
