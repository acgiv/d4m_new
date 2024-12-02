import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:d4m_new/business_logic/cubits/account_cubit.dart';
import 'package:d4m_new/business_logic/cubits/internet_cubit.dart';
import 'package:d4m_new/constants/enums.dart';
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
  final InternetCubit _internetCubit = InternetCubit(
    connectivity: Connectivity(), // Passa un'istanza di Connectivity
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountCubit>(
          create: (context) => _accountCubit,
        ),
        BlocProvider<InternetCubit>(
          create: (context) => _internetCubit,
        ),
      ],
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
          builder: (context, child) {
            return BlocListener<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state is InternetDisconnected) {
                  // Mostra il SnackBar senza limite di tempo
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                          "No Internet Connection",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        backgroundColor: Colors.red,
                        duration: const Duration(days: 365)),
                  );
                } else if (state is InternetConnected) {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  final connectionType =
                      state.connectionType == ConnectionType.Wifi
                          ? "WiFi"
                          : "Mobile";
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Connected to $connectionType",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: child,
            );
          }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _appRouter.dispose();
    _appRouter.dispose();
    _accountCubit.close();
  }
}
