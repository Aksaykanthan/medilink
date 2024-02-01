import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_01/pages/authentication/details_page.dart';

import 'package:project_01/pages/base_page.dart';
import 'package:project_01/pages/authentication/loginin_or_register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Future<String> checkDocumentExistence(
      String collectionName, String documentId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentReference documentReference =
          firestore.collection(collectionName).doc(documentId);
      DocumentSnapshot documentSnapshot = await documentReference.get();
      if (!documentSnapshot.exists) {
        return "false";
      } else {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        return data["role"];
      }
    } catch (e) {
      return "false";
    }
  }

  Future<void> checkUserProfile(String documentId, BuildContext context) async {
    String collectionName = 'users';
    String profileExists =
        await checkDocumentExistence(collectionName, documentId);

    if (profileExists == "patient") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const BasePage()),
      );
    } else if (profileExists == "doctor") {
      FirebaseAuth.instance.signOut();
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(builder: (context) => const AuthPage()),
      // );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          showCloseIcon: true,
          closeIconColor: Colors.white,
        content: Text("You are not Authorized to login to this app"),
        backgroundColor: Colors.grey[900],
      ));
    } else {
      // You might want to navigate to a different page or handle the case where the profile doesn't exist.
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const UserDetails()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Use await to get the result before making a decision
            checkUserProfile(FirebaseAuth.instance.currentUser!.uid, context);
          }
          // Return a placeholder widget; you might want to customize this part based on your needs
          return const LoginOrRegisterPage();
        },
      ),
    );
  }
}
