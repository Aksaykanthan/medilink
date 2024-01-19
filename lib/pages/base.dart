
import 'package:flutter/material.dart';
import 'package:project_01/pages/login_page.dart';


class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginPage());
  }
}