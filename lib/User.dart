import 'package:agendamento/Controller/ServicoController.dart';
import 'package:agendamento/Model/Servico.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';
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
  NumberFormat formatter = NumberFormat("00,00");
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Usuário"),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Colors.blue)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 100,
                        ),
                        radius: 50,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nome:${widget.nome}",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "Telefone:${widget.telefone}",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              FutureBuilder<List<Servico>>(
                future: ServicoController.TodosServico(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                          child: Center(
                        child: CircularProgressIndicator(),
                      ));
                    default:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('ERRORR'),
                        );
                      } else {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemExtent: 100,
                          controller: _scrollController,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data[index].descricao),
                              leading: Icon(Icons.account_balance),
                              subtitle: Text(
                                  "R\$ ${snapshot.data[index].valor.replaceAll('.', ',')}"),
                              onTap: () {},
                            );
                          },
                        );
                      }
                  }
                },
              )
            ],
          ),
        ));
  }
}
