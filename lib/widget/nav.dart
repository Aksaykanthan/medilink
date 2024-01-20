import 'package:flutter/material.dart';
import 'package:project_01/pages/list_doctors.dart';
import 'package:project_01/pages/profile_page.dart';
// import 'package:project_01/pages/list_doctors.dart';
// import 'package:project_01/pages/list_doctors.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
          height: 80,
          selectedIndex: currentPageIndex,
          elevation: 0,
          backgroundColor: Colors.white.withOpacity(0),
          indicatorColor: Colors.purple.shade100.withOpacity(0.5),
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          animationDuration: const Duration(milliseconds: 1500),
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined, size: 30), label: 'Home'),
            NavigationDestination(
                icon: Icon(Icons.calendar_month_outlined, size: 30),
                label: 'Appointment'),
            NavigationDestination(
                icon: Icon(Icons.medication_liquid_sharp,
                    size: 30), //Icons.medical_information_outlined
                label: 'Medicines'),
            NavigationDestination(
                icon: Icon(Icons.account_circle_outlined, size: 30), label: 'Settings'),
          ]),
      body: <Widget>[
        Container(
          alignment: Alignment.center,
          // child: const Text('Home', style: TextStyle(fontSize: 30)),
          child: const DoctorList(),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Appointment', style: TextStyle(fontSize: 30)),
        ),
        Container(
          alignment: Alignment.center,
          child: const Text('Medicines', style: TextStyle(fontSize: 30)),
        ),
        Container(
          alignment: Alignment.center,
          child: const ProfilePage(),
        ),
      ][currentPageIndex],
    );
  }
}
