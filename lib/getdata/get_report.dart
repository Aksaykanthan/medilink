import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUser extends StatelessWidget {
  final String userID = FirebaseAuth.instance.currentUser!.uid;
  GetUser({super.key});

  final DocTest = {
    "reason": "Fever",
    "name": "Dr.Shaun Murphy",
    "date": "12-05-2005",
    "summary": "summary placeholder...."
  };
  @override
  Widget build(BuildContext context) {
    CollectionReference doctor = FirebaseFirestore.instance.collection("users");

    return FutureBuilder(
      future: doctor.doc(userID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("data");
        }
        return const Text("Loading....");
      },
    );
  }
}
