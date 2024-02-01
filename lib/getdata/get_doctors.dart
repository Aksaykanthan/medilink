import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/doctor_card.dart';

class GetDoctor extends StatelessWidget {
  final String docID;
  const GetDoctor({super.key, required this.docID});

  @override
  Widget build(BuildContext context) {
    CollectionReference doctor = FirebaseFirestore.instance.collection("doctors");

    return FutureBuilder(
      future: doctor.doc(docID).get(),
      builder: (context,snapshot) {
        if (snapshot.connectionState == ConnectionState.done){
          Map<String,dynamic> data = snapshot.data!.data() as Map<String,dynamic>;
          return DoctorCard(data :data ,docId: docID);
        }
        return const Text("Loading....");
      }
    );
  }
}