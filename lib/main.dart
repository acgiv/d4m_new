import 'package:d4m_new/business_logic/cubits/navigation_bottonbar_cubit.dart';
import 'package:d4m_new/presentation/pages/home_page.dart';
import 'package:d4m_new/presentation/pages/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.black,
    surface: const Color.fromRGBO(
        244, 244, 243, 1), // colore di sfondo dell' applicazione
    onSurface: Colors.black, // colore della superfice ( esempio topbar)
    primary: const Color.fromRGBO(38, 137, 13, 1.0),
    secondary: const Color.fromRGBO(85, 85, 85, 1.0),
    tertiary: Colors.white);

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final NavigationCubit _navigator = NavigationCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const LoginPage(title: 'Login'),
        '/home': (context) => BlocProvider.value(
              value: _navigator,
              child: const HomePage(titleHome: 'Device4 Mobility'),
            ),
      },
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: kColorScheme,
          drawerTheme: DrawerThemeData(
            backgroundColor: kColorScheme.onSurface,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onSurface,
              iconTheme: IconThemeData(color: kColorScheme.surface),
              foregroundColor: kColorScheme.surface),
          cardTheme: const CardTheme().copyWith(
              color: kColorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kColorScheme.primaryContainer)),
          inputDecorationTheme: InputDecorationTheme(
              hintStyle:
                  const TextStyle(color: Colors.grey), // Colore per l'hintText
              prefixStyle: TextStyle(color: kColorScheme.onSurface)),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(color: kColorScheme.onSecondaryContainer))),
      themeMode: ThemeMode.system,
    );
  }
}
