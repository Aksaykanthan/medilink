import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/pages/details_page.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final currUser = FirebaseAuth.instance.currentUser!;
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
                  MaterialPageRoute(builder: (context) => UserDetails(onTap: () {  },)),
                );
              },
              icon: Icon(Icons.edit),
            ),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 80,
              // backgroundImage: AssetImage("assets/icons/shaun.jpeg"),
            ),
            Text(
              '${currUser.uid}',
            )
          ],
        ));
  }
}
