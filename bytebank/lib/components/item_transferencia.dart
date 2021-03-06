import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(Icons.monetization_on),
            title: Text(this._transferencia.valor.toString()),
            subtitle: Text(this._transferencia.numeroConta.toString()),
          ),
        ),
      ],
    );
  }
}
