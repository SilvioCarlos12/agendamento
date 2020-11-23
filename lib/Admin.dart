import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  final String nome;
  final String id;
  final String email;
  final String telefone;
  Admin(this.nome, this.email, this.id, this.telefone, {Key key})
      : super(key: key);

  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.email),
    );
  }
}
