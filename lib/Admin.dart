import 'package:agendamento/Controller/ServicoController.dart';
import 'package:agendamento/Model/Servico.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
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
  NumberFormat formatter = NumberFormat("00,00");
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: IconButton(
          icon: Icon(Icons.add),
          color: Colors.green,
          iconSize: 50,
          tooltip: "adiciona um novo Produto",
          onPressed: () {
            Navigator.pushNamed(context, "/cadastroProduto");
          },
        ),
        appBar: AppBar(
          title: Text("Administrador"),
          backgroundColor: Colors.orangeAccent,
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
                              "Email:${widget.email}",
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              "Nome:${widget.nome}",
                              style: TextStyle(fontSize: 25),
                            )
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
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            mouseCursor: MouseCursor.defer,
                            enabled: true,
                            title: Text(snapshot.data[index].descricao),
                            leading: Icon(Icons.account_balance),
                            subtitle: Text(
                                "R\$ ${snapshot.data[index].valor.replaceAll('.', ',')}"),
                            onTap: () {},
                          );
                        },
                      );
                    }
                  })
            ],
          ),
        ));
  }
}
