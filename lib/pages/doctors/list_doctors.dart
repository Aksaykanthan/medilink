import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_01/getdata/get_doctors.dart';

class DoctorList extends StatefulWidget {
  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  List<String> docID = [];

  Future getAllDoc() async {
    docID.clear();
    await FirebaseFirestore.instance.collection("doctors").get().then(
          (snapshot) => snapshot.docs.forEach((element) {
            docID.add(element.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAllDoc(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: docID.length,
                itemBuilder: (context, index) {
                  return GetDoctor(docID: docID[index]);
                });
          }),
    );
  }
}
