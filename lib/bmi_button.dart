import 'package:flutter/material.dart';

class BMIButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const BMIButton({Key key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        onPressed: this.onTap,
        child: Text(
          this.text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        color: Colors.green,
      ),
    );
  }
}
