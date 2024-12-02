
import 'package:d4m_new/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LoginScreen(title: title), // Il contenuto della tua login page
    );
  }
}
