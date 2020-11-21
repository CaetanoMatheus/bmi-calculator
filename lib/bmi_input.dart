import 'package:flutter/material.dart';

class BMIInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function validator;

  const BMIInput({
    Key key,
    this.label,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: this.label,
        labelStyle: TextStyle(color: Colors.green),
      ),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 25),
      controller: this.controller,
      validator: this.validator,
    );
  }
}
