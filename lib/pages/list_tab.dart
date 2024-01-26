import 'package:flutter/material.dart';
import 'package:project_01/pages/doctors/list_doctors.dart';
import 'package:project_01/pages/doctors/list_hospital.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
          appBar: TabBar(
            indicatorColor:Colors.black,
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.person),
              ),
              Tab(
                icon: Icon(Icons.apartment),
              ),
            ],
          ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: DoctorList(),
            ),
            Center(
              child: HospitalList(),
            ),
          ],
        ),
        ),
    );
  }
}
