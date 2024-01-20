import 'package:flutter/material.dart';

class ViewDetails extends StatelessWidget {
  final String title;
  final String answer;
  const ViewDetails({super.key, required this.title, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
      child: Container(
        color: Colors.amber,
        alignment: Alignment.center,
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              answer,
              style: const TextStyle(fontSize: 20,),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
