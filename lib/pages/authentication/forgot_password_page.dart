import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_01/components/button.dart';
import 'package:project_01/components/textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _email = TextEditingController();
  @override
  void dispose() {
    _email.dispose();    
    super.dispose();
  }
  
  Future passwordReset() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email.text.trim());
      errorMessage("Password Reset Link sent Successfully! Check Your Inbox");
    } on FirebaseAuthException catch (e){
      errorMessage(e.message.toString());
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
      appBar: AppBar(
        title: const Text("Forgot Password") ,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        ),
        
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Text("Enter Your Email",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        const SizedBox(height: 20,),
        const Text(" we will sent you a Password Reset Link.",style: TextStyle(fontSize: 15),),
        const SizedBox(height: 30,),
        CustomTextField(hintText: "Email Address", obscureText: false,controller: _email,),
        const SizedBox(height: 20,),
        CustomButton(onTap: passwordReset, text: "Reset Password")
        ]
        ),
    );
  }
}