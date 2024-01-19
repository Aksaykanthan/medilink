import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/widget/nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'mr dr',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          actions: [IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout,color: Colors.black,))],
          
          ),
          body:const NavBar() ,
    );
  }
}
