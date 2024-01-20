import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/button.dart';
import 'package:project_01/components/view_details.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void showNotifications(){}
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text("Profile",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              CircleAvatar(radius: 80,backgroundImage:AssetImage("assets/icons/shaun.jpeg"),),
              SizedBox(height: 30,),
              ViewDetails(title: "Name",answer: "Shaun Murphy",),
              ViewDetails(title: "Date of Birth",answer: "01-04-2006",),
              ViewDetails(title: "Phone No",answer: "3450845689",),
              ViewDetails(title: "Gender",answer: "Male",),
              SizedBox(height: 50,),
              CustomButton(onTap: signUserOut,text: "Sign Out")
            ],
          ),
          ),
          ),
    );
  }
}
