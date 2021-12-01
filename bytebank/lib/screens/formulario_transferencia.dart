import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppbar = 'Criando Transferências';
const _rotuloConta = 'Número da Conta';
const _hintConta = '000';
const _rotuloValor = 'Valor';
const _hintValor = '0.00';
const _textoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _numeroDaContacontroller =
      TextEditingController();

  final TextEditingController _valorcontroller = TextEditingController();

  @override
  _FormularioTransferenciaState createState() =>
      _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppbar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: widget._numeroDaContacontroller,
                rotulo: _rotuloConta,
                hintText: _hintConta),
            Editor(
                controller: widget._valorcontroller,
                rotulo: _rotuloValor,
                hintText: _hintValor,
                icone: Icons.monetization_on),
            ElevatedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textoConfirmar))
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(widget._numeroDaContacontroller.text);
    final double valor = double.parse(widget._valorcontroller.text);
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
