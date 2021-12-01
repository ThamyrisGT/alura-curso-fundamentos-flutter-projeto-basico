import 'package:flutter/material.dart';

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
