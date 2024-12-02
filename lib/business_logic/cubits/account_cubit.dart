import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:d4m_new/data/models/account_model.dart';
import 'package:d4m_new/data/repositories/account_repository.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final AccountRepository accountRepository = AccountRepository();

  AccountCubit() : super(AuthInitial());

  Future<void> login(Login login) async {
    try {
      emit(AuthLoading()); // Emissione dello stato di caricamento
      final token =
          await accountRepository.getLogin(login); // Chiamata al repository
      emit(AuthSuccess(token!)); // Emissione dello stato di successo
    } catch (e) {
      emit(AuthError(
          'Login fallito: ${e.toString()}')); // Emissione dello stato di errore
    }
  }
}
