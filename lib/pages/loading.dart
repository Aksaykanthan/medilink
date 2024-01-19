
import 'package:flutter/material.dart';

class LoadingCard extends StatelessWidget {
  const LoadingCard(this.featureName,{super.key});
  final String featureName;

  @override
  Widget build(BuildContext context) {
    return Card(
          shadowColor: Colors.transparent,
          margin: const EdgeInsets.all(8.0),
          child: SizedBox.expand(
            child: Center(
              child: Text(
                '$featureName Loading',
              ),
            ),
          ),
        );
  }
}
