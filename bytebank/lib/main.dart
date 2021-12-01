import 'package:flutter/material.dart';
import 'screens/lista_transferencia.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.blueAccent[700],
        ),
        appBarTheme: AppBarTheme(backgroundColor: Colors.purple),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.purple),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
      home: ListaTransferencia(),
    );
  }
}
