import 'package:flutter/material.dart';
import 'package:project_01/widget/nav.dart';

class HomePage extends StatelessWidget {

  const HomePage({super.key});

  void showNotifications() {}
  

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
          actions: [
          IconButton(
              onPressed: showNotifications,
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
          
          ),
          body:const NavBar() ,
    );
  }

}
