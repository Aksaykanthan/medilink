import 'package:flutter/material.dart';
import 'package:project_01/components/medicine_card.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    // return const DoctorCard();

    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              MedicineCard(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
