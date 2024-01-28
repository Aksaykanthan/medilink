import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/medicine_card.dart';

class MedicineList extends StatefulWidget {
  const MedicineList({super.key});

  @override
  State<MedicineList> createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  List MedID = [MedicineCard, MedicineCard, MedicineCard];

  // Future getMedicine() async {
  //   MedID.clear();
  //   await FirebaseFirestore.instance
  //       .collection("doctors")
  //       .get()
  //       .then((snapshot) => snapshot.docs.forEach((element) {
  //             MedID.add(element.reference.id);
  //           }));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: MedID.length,
          itemBuilder: (context, index) {
            return MedID[index];
            //return GetMedicine(MedID: MedID[index]);
          }),
    );
  }
}
