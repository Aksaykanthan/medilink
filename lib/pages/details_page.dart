import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/button.dart';
import 'package:project_01/components/textfield.dart';

class UserDetails extends StatefulWidget {
  final Function()? onTap;
  const UserDetails({super.key, required this.onTap});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  // controller
  final firstname = TextEditingController();
  final dob = TextEditingController();
  final confirmpassword = TextEditingController();

  Future<void> addDetailsToFirestore(String collectionName, String documentId,
      Map<String, dynamic> data) async {
    try {
      // Access Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Reference to the collection and document
      CollectionReference collectionReference =
          firestore.collection(collectionName);
      DocumentReference documentReference = collectionReference.doc(documentId);

      // Add data to the specified document
      await documentReference.set(data);

      print('Details added to Firestore successfully!');
    } catch (e) {
      print('Error adding details to Firestore: $e');
    }
  }

  void addUserDetails() async {
    String collectionName = 'users';

    String customDocumentId = FirebaseAuth.instance.currentUser! as String;

    Map<String, dynamic> data = {
      'name': 'John Doe',
      'age': 25,
      'email': 'john.doe@example.com',
    };

    await addDetailsToFirestore(collectionName, customDocumentId, data);
  }

  void getUserDetails() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Set Up Profile"),backgroundColor: Colors.grey[900],foregroundColor: Colors.white,),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const SizedBox(height: 25),
            CustomTextField(
              hintText: 'Name',
              obscureText: false,
              controller: firstname,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'DOB',
              obscureText: false,
              controller: dob,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              hintText: 'Age',
              obscureText: false,
              controller: dob,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 25),
            CustomButton(
              onTap: getUserDetails,
              text: "Save",
            ),
          ],
        ),
      ),
    );
  }
}
