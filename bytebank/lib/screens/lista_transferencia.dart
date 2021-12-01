import 'package:bytebank/components/item_transferencia.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario_transferencia.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _listaTranferencia = [];

  @override
  _ListaTransferenciaState createState() => _ListaTransferenciaState();
}

class _ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tituloAppBar)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          })).then((value) => _atualiza(value));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final transferencia = widget._listaTranferencia[index];
          return ItemTransferencia(transferencia);
        },
        itemCount: widget._listaTranferencia.length,
      ),
    );
  }

  void _atualiza(Transferencia? value) {
    if (value != null) {
      setState(() {
        widget._listaTranferencia.add(value);
      });
    }
  }
}
