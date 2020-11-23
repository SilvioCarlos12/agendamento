import 'package:flutter/material.dart';
import 'package:agendamento/Controller/CadastroController.dart';
import 'Widget/Alertdialog.dart';

class CadastroPage extends StatefulWidget {
  CadastroPage({Key key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

final TextEditingController email = TextEditingController();
final TextEditingController senha = TextEditingController();
final TextEditingController nome = TextEditingController();
final TextEditingController telefone = TextEditingController();
bool _isloading = false;

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pushReplacementNamed(context, '/'),
        ),
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
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
                            'Cadastro',
                            style: TextStyle(fontSize: 40),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: senha,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Senha'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: nome,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: telefone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Telefone'),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: MaterialButton(
                                  onPressed: () {
                                    String reposta = '';
                                    setState(() {
                                      _isloading = true;
                                    });
                                    CadastroController.gravarCliente(
                                            email.text,
                                            senha.text,
                                            nome.text,
                                            telefone.text)
                                        .then((value) {
                                      _isloading = false;
                                      email.clear();
                                      senha.clear();
                                      nome.clear();
                                      telefone.clear();
                                      modal(context, value);
                                    });
                                  },
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
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
