import 'package:flutter_bloc/flutter_bloc.dart';
part 'navigation_bottombar_state.dart';

class NavigationCubit extends Cubit<Navigationbottombar> {
  NavigationCubit()
      : super(Navigationbottombar(indexPage: 0)); // Stato iniziale

  void selectPage(int index) {
    emit(Navigationbottombar(
        indexPage: index)); // Aggiorna lo stato con un nuovo oggetto
  }
}
