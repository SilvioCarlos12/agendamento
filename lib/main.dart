import 'package:agendamento/Cadastro.dart';
import 'package:flutter/material.dart';
import 'package:agendamento/Login.dart';
import 'package:agendamento/Cadastro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        "/cadastro": (context) => CadastroPage()
      },
    );
  }
}
