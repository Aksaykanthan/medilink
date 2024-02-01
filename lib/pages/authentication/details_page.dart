import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/pages/base_page.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController name = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController bloodGroup = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController emphoneno = TextEditingController();

  // FireBase
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

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BasePage()));
      errorMessage('Details added to Firestore successfully!');
    } catch (e) {
      errorMessage('Error adding details to Firestore: $e');
    }
  }

  void addUserDetails() async {
    String collectionName = 'users';

    String? customDocumentId = FirebaseAuth.instance.currentUser?.uid;

    Map<String, dynamic> data = {
      "role" : "patient",
      "name": name.text,
      "dob": dob.text,
      "height": height.text,
      "weight": weight.text,
      "gender": gender.text,
      "bloodGroup": bloodGroup.text,
      "city": city.text,
      "phoneno": phoneno.text,
      "emphoneno": emphoneno.text,
      "fav":[]
    };
    await addDetailsToFirestore(collectionName, customDocumentId!, data);
  }

  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        title: Text('Setup Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: name,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'Name',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dob,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'Date of Birth',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: height,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Height',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: weight,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      labelText: 'Weight',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: gender,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'Gender',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 10),
            TextField(
              controller: bloodGroup,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'Blood Group',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 10),
            TextField(
              controller: city,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'City',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneno,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'Phone No',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emphoneno,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  labelText: 'Emergency Phone No',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  )),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                // You can customize other properties here, like textStyle, elevation, etc.
              ),
              onPressed: () {
                addUserDetails();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
