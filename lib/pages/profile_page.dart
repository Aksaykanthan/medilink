import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/getdata/get_user.dart';
import 'package:project_01/pages/authentication/details_page.dart';

class ProfilePage extends StatelessWidget {
  // final Map<String,dynamic> user;
  ProfilePage({super.key});

  final currUser =  FirebaseAuth.instance.currentUser!;
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
        body: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 80,
              // backgroundImage: AssetImage("assets/icons/shaun.jpeg"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${currUser.email}',
            ),
            GetUser()
          ],
        ));
  }
}
