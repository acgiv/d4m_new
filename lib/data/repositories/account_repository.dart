import 'package:d4m_new/data/dataproviders/account_provider.dart';
import 'package:d4m_new/data/models/account_model.dart';
import 'dart:convert'; // Necessario per la decodifica JSON

class AccountRepository {
  final AccountProvider accountProvider = AccountProvider();

  AccountRepository();

  Future<String?> getLogin(Login login) async {
    // Chiama il metodo getLogin del provider
    final response = await accountProvider.getLogin(login);

    // Verifica se la risposta non è nulla
    if (response != null) {
      try {
        // Decodifica la stringa JSON ricevuta in una mappa
        final responseData = jsonDecode(response);

        // Ritorna il valore della chiave 'token' come stringa
        if (responseData is Map<String, dynamic> &&
            responseData.containsKey('token')) {
          return responseData['token'];
        } else {
          //print('Token non trovato nella risposta JSON.');
          return null;
        }
      } catch (e) {
        //print('Errore nella decodifica della risposta JSON: $e');
        return null;
      }
    } else {
      //print('Risposta nulla dal provider.');
      return null;
    }
  }
}
