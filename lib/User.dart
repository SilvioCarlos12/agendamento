import 'package:flutter/material.dart';

class User extends StatefulWidget {
  final String nome;
  final String id;
  final String email;
  final String telefone;
  User(this.nome, this.email, this.id, this.telefone, {Key key})
      : super(key: key);

  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(widget.email),
    );
  }
}
