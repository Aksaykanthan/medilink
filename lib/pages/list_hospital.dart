import 'package:flutter/material.dart';
import 'package:project_01/components/hospital_card.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({super.key});

  @override
  Widget build(BuildContext context) {
    // return const DoctorCard();

    return const Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              HospitalCard(),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
