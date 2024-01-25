import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/title_button.dart';

class AppDrawer extends StatelessWidget {
  final navHome;
  final navProfile;
  const AppDrawer({super.key, this.navHome, this.navProfile});
  
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const DrawerHeader(
                  child: Icon(Icons.person_pin, color: Colors.white, size: 80),
                ),
                TitleBtn(
                  icon: Icons.home,
                  text: "H O M E",
                  onTap: navHome,
                ),
                TitleBtn(
                  icon: Icons.person_2,
                  text: "P R O F I L E",
                  onTap: navProfile,
                ),
                TitleBtn(
                  icon: Icons.favorite,
                  text: "F A V O U R I T E",
                  onTap: navProfile,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: TitleBtn(
                icon: Icons.logout,
                text: "L O G O U T",
                onTap: signUserOut,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
