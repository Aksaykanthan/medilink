import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUser extends StatelessWidget {
  final String userID = FirebaseAuth.instance.currentUser!.uid;
  GetUser({super.key});

  @override
  Widget build(BuildContext context) {
    CollectionReference doctor = FirebaseFirestore.instance.collection("users");

    return FutureBuilder(
        future: doctor.doc(userID).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              children: [
                Text(data["name"]),
                Text(data["dob"]),
                Text(data["height"]),
                Text(data["weight"]),
                Text(data["gender"]),
                Text(data["bloodGroup"]),
                Text(data["city"]),
                Text(data["phoneno"]),
                Text(data["emphoneno"]),

              ],
            );
          }
          return const Text("Loading....");
        });
  }
}
