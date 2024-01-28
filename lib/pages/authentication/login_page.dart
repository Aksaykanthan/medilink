import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/button.dart';
import 'package:project_01/components/square_title.dart';
import 'package:project_01/components/textfield.dart';
import 'package:project_01/pages/authentication/forgot_password_page.dart';
import 'package:project_01/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controller
  final email = TextEditingController();

  final password = TextEditingController();

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        Navigator.pop(context);
      }
        if (e.code == 'invalid-email') {
          errorMessage("Incorrect Email");
        } else if (e.code == 'invalid-credential') {
          errorMessage("Incorrect Password");
        }
    }
  }

  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
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
                const Icon(Icons.medical_information_outlined, size: 100),
                const SizedBox(height: 25),
                const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  hintText: 'Email Address',
                  obscureText: false,
                  controller: email,
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  hintText: 'Password',
                  obscureText: true,
                  controller: password,
                  // icon: Icon(Icons.search),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(onTap:() {
                        Navigator.push(context,MaterialPageRoute(builder: (context){
                          return const ForgotPasswordPage();
                        }));
                      }, child: const Text("Forgot Password?", style: TextStyle(fontSize: 16))),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
          
                CustomButton(
                  onTap: signIn,
                  text: "Sign In",
                ),
          
                const SizedBox(height: 50),
          
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or continue with",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      )),
                    ],
                  ),
                ),
          
                const SizedBox(height: 10),
          
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'assets/logo/google.png', onTap: () => { AuthService().signInWithGoogle() },),
          
                    const SizedBox(width: 25),
          
                    // apple button
                    SquareTile(imagePath: 'assets/logo/apple.png', onTap: () => { },)
                  ],
                ),
                const SizedBox(height: 50),
          
                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
