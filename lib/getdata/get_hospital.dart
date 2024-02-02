import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/hospital_card.dart';

class GetHospital extends StatelessWidget {
  final String hospID;
  const GetHospital({super.key, required this.hospID});

  @override
  Widget build(BuildContext context) {
    CollectionReference hospital = FirebaseFirestore.instance.collection("hospital");

    return FutureBuilder(
      future: hospital.doc(hospID).get(),
      builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
          return HospitalCard(data :data ,hospId: hospID);
        }
        return const Text("Loading....");
      }
    );
  }
}