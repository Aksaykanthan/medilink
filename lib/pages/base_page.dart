import 'package:flutter/material.dart';
import 'package:project_01/pages/notifications.dart';
import 'package:project_01/pages/profile_page.dart';
import 'package:project_01/widget/drawer.dart';
import 'package:project_01/widget/nav.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  void navProfile(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProfilePage()));
  }

  void navHome(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => BasePage()));
  }

  void navNotification(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Notifications()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        navProfile: () {
          navProfile(context);
        },
        navHome: () => {navHome(context)},
      ),
      appBar: AppBar(
        title: const Text(
          'MediLink',
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => {navNotification(context)},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
              ))
        ],
      ),
      body: const NavBar(),
    );
  }
}
