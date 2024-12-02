import 'package:d4m_new/business_logic/cubits/navigation_bottonbar_cubit.dart';
import 'package:d4m_new/presentation/pages/home_page.dart';
import 'package:d4m_new/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final NavigationCubit _navigator = NavigationCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (context) => const LoginPage(title: 'Login'));

      case '/home':
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: _navigator,
                  child: const HomePage(titleHome: 'Device4 Mobility'),
                ));

      // Gestisci il fallback
      default:
        return null; // Pagina di errore o "Not Found"
    }
  }

  void dispose() {
    _navigator.close();
  }
}
