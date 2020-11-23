import 'package:http/http.dart' as http;
import 'dart:convert';

class CadastroController {
  static Future gravarCliente(
      String email, String senha, String nome, String telefone) async {
    try {
      final url =
          'https://sandbox.adiantibuilder.com.br/silvionetma/testando/cliente';
      var reposta = await http.post(url,
          body: json.encode({
            "nome": nome,
            "senha": senha,
            "telefone": telefone,
            "email": email
          }),
          headers: {
            "Authorization":
                "Basic bc1b7ba57565a6b2e2ed64675aae5dfcb54feeaf63ad8a6d539b9c15e2ac"
          });
      if (reposta.statusCode == 200) {
        return "Sucesso no cadastro";
      } else {
        return "Ocorreu um erro no cadastro";
      }
    } catch (e) {}
  }
}
