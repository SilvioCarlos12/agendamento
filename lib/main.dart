import 'package:agendamento/Cadastro.dart';
import 'package:agendamento/CadastroProduto.dart';
import 'package:flutter/material.dart';
import 'package:agendamento/Login.dart';
import 'package:agendamento/Cadastro.dart';

void main() {
  runApp(Agendamento());
}

class Agendamento extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/cadastro": (context) => CadastroPage(),
        "/cadastroProduto": (context) => CadastroProdutoPage()
      },
    );
  }
}
