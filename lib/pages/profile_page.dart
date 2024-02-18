import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/mytextbox.dart';
import 'package:project_01/pages/authentication/details_page.dart';

class ProfilePage extends StatelessWidget {
  // final Map<String,dynamic> user;
  ProfilePage({super.key});

  //user
  final currUser = FirebaseAuth.instance.currentUser!;
  //all users
  final userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> editField(String field, BuildContext context) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Edit $field",
                style: const TextStyle(color: Colors.black),
              ),
              content: TextField(
                autofocus: true,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    hintText: "Enter new $field",
                    hintStyle: TextStyle(color: Colors.grey[200])),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                //cancel Button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(color: Colors.black),
                    )),
                //save Button
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(newValue);
                    },
                    child: const Text("Save",
                        style: TextStyle(color: Colors.black)))
              ],
            ));
    if (newValue.trim().isNotEmpty) {
      print(newValue);
      await userCollection.doc(currUser.uid).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          title: const Text(
            "Profile",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Navigate to UserDetails page when edit icon is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UserDetails()),
                );
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(currUser.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> userData =
                  snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    // backgroundImage: AssetImage("assets/icons/shaun.jpeg"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${currUser.email}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Text("My Details",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                  ),
                  Mytextbox(
                    text: userData['name'],
                    sectionName: 'username',
                    onPressed: () => editField('name', context = context),
                  ),
                  Mytextbox(
                    text: userData['dob'],
                    sectionName: 'Date of Birth',
                    onPressed: () => editField('dob', context = context),
                  ),
                  Mytextbox(
                    text: userData['height'],
                    sectionName: 'Height',
                    onPressed: () => editField('height', context = context),
                  ),
                  Mytextbox(
                    text: userData['weight'],
                    sectionName: 'Weight',
                    onPressed: () => editField('weight', context = context),
                  ),
                  Mytextbox(
                    text: userData['gender'],
                    sectionName: 'Gender',
                    onPressed: () => editField('gender', context = context),
                  ),
                  Mytextbox(
                    text: userData['bloodGroup'],
                    sectionName: 'Blood Group',
                    onPressed: () => editField('bloodGroup', context = context),
                  ),
                  Mytextbox(
                    text: userData['city'],
                    sectionName: 'City',
                    onPressed: () => editField('city', context = context),
                  ),
                  Mytextbox(
                    text: userData['phoneno'],
                    sectionName: 'Phone Number',
                    onPressed: () => editField('phoneno', context = context),
                  ),
                  Mytextbox(
                    text: userData['emphoneno'],
                    sectionName: 'Emergency Phone Number',
                    onPressed: () => editField('emphoneno', context = context),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error${snapshot.error}"),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
