import 'package:flutter/material.dart';
import 'package:project_01/components/button.dart';
import 'package:project_01/components/textfield.dart';

class UserDetails extends StatefulWidget {
  final Function()? onTap;
  const UserDetails({super.key, required this.onTap});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  // controller
  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final confirmpassword = TextEditingController();


  void getUserDetails() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Set Up Profile",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  hintText: 'First Name',
                  obscureText: false,
                  controller: firstname,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Last Name',
                  obscureText: false,
                  controller: lastname,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: 'Last Name',
                  obscureText: false,
                  controller: lastname,
                ),
                const SizedBox(height: 10),




                const SizedBox(height: 25),
                CustomButton(
                  onTap: getUserDetails,
                  text: "Save",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
