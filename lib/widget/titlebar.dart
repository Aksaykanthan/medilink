import 'package:flutter/material.dart';
import 'package:project_01/pages/loading.dart';
import 'package:project_01/widget/nav.dart';

class TitleBar extends StatelessWidget {
  const TitleBar(this.titleName, {super.key});
  final String titleName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(
              titleName,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => {const LoadingCard("Notification")},
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ],
            leading: Container(
              margin: const EdgeInsets.all(10),
              // child: SvgPicture.asset(),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
            ),
          ),
          bottomNavigationBar: const NavBar()
    );
  }
}
