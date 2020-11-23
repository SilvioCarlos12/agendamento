import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agendamento/Model/Cliente.dart';

class LoginController {
  static Future<Cliente> Login(String email, String senha) async {
    const url =
        'https://sandbox.adiantibuilder.com.br/silvionetma/testando/rest.php';
    var reposta = await http.post(url,
        body: json.encode({
          "senha": senha,
          "email": email,
          "class": 'ClienteRestService',
          'method': 'carregacliente'
        }),
        headers: {
          "Authorization":
              "Basic bc1b7ba57565a6b2e2ed64675aae5dfcb54feeaf63ad8a6d539b9c15e2ac"
        });
    if (reposta.statusCode == 200) {
      var dados = json.decode(reposta.body);
      var cliente = Cliente.fromJson(dados['data']);
      return cliente;
    } else {
      return null;
    }
  }
}
