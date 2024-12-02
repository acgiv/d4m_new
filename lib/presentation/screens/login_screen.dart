import 'package:d4m_new/business_logic/cubits/account_cubit.dart';
import 'package:d4m_new/data/models/account_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});

  final String title;

  @override
  State<LoginScreen> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  final double _paddingInputH = 30;
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _accedi() {
    if (_formKey.currentState!.validate()) {
      final email = _userController.text.trim();
      final password = _passwordController.text.trim();

      // Richiama il Cubit per effettuare il login
      context
          .read<AccountCubit>()
          .login(Login(username: email, password: password));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Image.asset(
                'assets/images/png/logo_app_splash.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: _paddingInputH,
                          vertical: 16), // Facoltativo
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userController,
                        decoration: const InputDecoration(
                            label: Text("Email*"),
                            hintText: "Inserisci l'email",
                            border: UnderlineInputBorder(),
                            prefixIcon: Icon(Icons.mail)),
                        validator: (value) {
                          if (value == null ||
                              (value.toString()).trim().isEmpty) {
                            return 'Questo campo non può essere vuoto';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: _paddingInputH), // Facoltativo
                      child: TextFormField(
                        obscureText: !_isPasswordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            label: const Text("Password*"),
                            border: const UnderlineInputBorder(),
                            hintText: 'Inserisci la password',
                            prefixIcon: const Icon(Icons.lock),
                            suffix: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            )),
                        validator: (value) {
                          if (value == null ||
                              (value.toString()).trim().isEmpty) {
                            return 'Questo campo non può essere vuoto';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      alignment: Alignment.topLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forget or password?',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          )),
                    ),
                    const SizedBox(height: 24),
                    BlocListener<AccountCubit, AccountState>(
                      listener: (context, state) {
                        if (state is AuthSuccess) {
                          Navigator.of(context).pushNamed('/home');
                        } else if (state is AuthError) {
                          // Errore: Mostra un messaggio di errore
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }
                      },
                      child: BlocBuilder<AccountCubit, AccountState>(
                        builder: (context, state) {
                          if (state is AuthLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          return Material(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            elevation: 3.0,
                            color: Theme.of(context).colorScheme.primary,
                            clipBehavior: Clip.antiAlias,
                            child: MaterialButton(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 60),
                                minWidth: 34,
                                height: 34,
                                onPressed: _accedi,
                                child: Text(
                                  "Accedi",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                                )),
                          );
                        },
                      ),
                    )
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
