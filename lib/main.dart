import 'package:d4m_new/business_logic/cubits/account_cubit.dart';
import 'package:d4m_new/presentation/routers/app_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
    seedColor: Colors.black,
    surface: const Color.fromRGBO(
        244, 244, 243, 1), // colore di sfondo dell' applicazione
    onSurface: Colors.black, // colore della superfice ( esempio topbar)
    primary: const Color.fromRGBO(38, 137, 13, 1.0),
    secondary: const Color.fromRGBO(85, 85, 85, 1.0),
    tertiary: Colors.white);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();
  final AccountCubit _accountCubit = AccountCubit();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return BlocProvider<AccountCubit>(
      create: (context) => _accountCubit,
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: _appRouter.onGenerateRoute,
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
                margin:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kColorScheme.primaryContainer)),
            inputDecorationTheme: InputDecorationTheme(
                hintStyle: const TextStyle(
                    color: Colors.grey), // Colore per l'hintText
                prefixStyle: TextStyle(color: kColorScheme.onSurface)),
            textTheme: ThemeData().textTheme.copyWith(
                titleLarge:
                    TextStyle(color: kColorScheme.onSecondaryContainer))),
        themeMode: ThemeMode.system,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _appRouter.dispose();
    _accountCubit.close();
  }
}
