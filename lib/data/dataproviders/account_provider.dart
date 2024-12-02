import 'package:d4m_new/data/models/account_model.dart';
//import 'package:http/http.dart' as http;
import 'dart:convert';

class AccountProvider {
  final Uri url =
      Uri.https('www.example.com', '/api/login'); // Modifica l'endpoint

  Future<String?> getLogin(Login login) async {
    try {
      // Payload della richiesta
      // final payload = {
      //   'Username': login.username,
      //   'Password': login.password,
      // };

      // // Chiamata POST
      // final response = await http.post(
      //   url,
      //   headers: {
      //     'Content-Type': 'application/json',
      //   },
      //   body: jsonEncode(payload),
      // );

      // // Gestione della risposta
      // if (response.statusCode == 200) {
      //   final responseData = jsonDecode(response.body);

      //   // Controlla se il token è presente
      //   if (responseData.containsKey('token')) {
      //     return responseData['token']; // Ritorna il token
      //   } else {
      //     print('Token non trovato nella risposta.');
      //     return null;
      //   }
      // } else {
      //   // Gestione degli errori HTTP
      //   print('Errore HTTP: ${response.statusCode} - ${response.body}');
      //   return null;
      // }
      return jsonEncode({'token': 'ddddd'});
    } catch (e) {
      // Gestione degli errori generali
      //print('Eccezione catturata: $e');
      return null;
    }
  }
}
