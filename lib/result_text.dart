import 'package:flutter/material.dart';

class ResultText extends StatelessWidget {
  final String value;

  const ResultText({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.value,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.green, fontSize: 25),
    );
  }
}
