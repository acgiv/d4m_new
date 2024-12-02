import 'package:d4m_new/business_logic/cubits/account_cubit.dart';

import 'package:d4m_new/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: LoginScreen(title: title)),
    );
  }
}
