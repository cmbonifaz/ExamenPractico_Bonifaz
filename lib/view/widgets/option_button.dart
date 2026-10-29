import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final String valor;
  final String seleccionado;
  final Function(String?) onChange;

  OptionButton({
    required this.text,
    required this.valor,
    required this.seleccionado,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(text),
      value: valor,
      groupValue: seleccionado,
      onChanged: onChange,
    );
  }
}

