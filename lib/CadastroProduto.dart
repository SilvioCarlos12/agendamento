import 'package:flutter/material.dart';
import 'package:agendamento/Controller/CadastroController.dart';
import 'Widget/Alertdialog.dart';

class CadastroProdutoPage extends StatefulWidget {
  CadastroProdutoPage({Key key}) : super(key: key);

  @override
  _CadastroProdutoPageState createState() => _CadastroProdutoPageState();
}

final TextEditingController descricao = TextEditingController();
final TextEditingController valor = TextEditingController();

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cadastro de Produto',
                      style: TextStyle(fontSize: 40),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: descricao,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.add_box),
                            labelText: 'Nome do Produto'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: valor,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.monetization_on),
                          labelText: 'Valor do Produto',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: MaterialButton(
                            onPressed: () {
                              String reposta = '';

                              double valores = double.parse(valor.text);
                              CadastroController.gravarProduto(
                                      descricao.text, valores)
                                  .then((value) {
                                modal(context, value);
                                descricao.clear();
                                valor.clear();
                              });
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height / 10,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(child: Text('Cadastrar')),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
