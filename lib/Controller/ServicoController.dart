import 'package:agendamento/Model/Servico.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ServicoController {
  static Future<List<Servico>> TodosServico() async {
    const url =
        'https://sandbox.adiantibuilder.com.br/silvionetma/testando/servico';
    var reposta = await http.get(
      url,
      headers: {
        "Authorization":
            "Basic bc1b7ba57565a6b2e2ed64675aae5dfcb54feeaf63ad8a6d539b9c15e2ac"
      },
    );
    if (reposta.statusCode == 200) {
      var dados = json.decode(reposta.body);
      print(dados['data']);
      var servico = dados['data'].map<Servico>((value) {
        // tinha que mapea pois estava vindo uma list do objeto
        return Servico.fromJson(value);
      }).toList();

      return servico;
    }
  }
}
