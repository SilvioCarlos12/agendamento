import 'package:flutter/material.dart';

Widget modal(BuildContext context, String titulo) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            )
          ],
        );
      });
}
