import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _numeroDaContacontroller =
      TextEditingController();
  final TextEditingController _valorcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferências'),
      ),
      body: Column(
        children: [
          Editor(
              controller: _numeroDaContacontroller,
              rotulo: 'Número da Conta',
              hintText: '000'),
          Editor(
              controller: _valorcontroller,
              rotulo: 'Valor',
              hintText: '0.00',
              icone: Icons.monetization_on),
          ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text("Continuar"))
        ],
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_numeroDaContacontroller.text);
    final double valor = double.parse(_valorcontroller.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);

      // debugPrint('$transferenciaCriada');
      // Scaffold.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text('$transferenciaCriada'),
      //   ),
      //);
    }
  }
}

class Editor extends StatelessWidget {
  Editor(
      {required this.controller,
      required this.rotulo,
      this.icone,
      required this.hintText});

  final TextEditingController controller;
  final String rotulo;
  final String hintText;
  final IconData? icone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencia(),
      ),
    );
  }
}

class ListaTransferencia extends StatelessWidget {
  final List<Transferencia> _listaTranferencia = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transferências")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((value) {
            if (value != null) {
              _listaTranferencia.add(value);
            }
          });
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final transferencia = _listaTranferencia[index];
          return ItemTransferencia(transferencia);
        },
        itemCount: _listaTranferencia.length,
      ),
    );
  }
}

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
        )),
      ],
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
