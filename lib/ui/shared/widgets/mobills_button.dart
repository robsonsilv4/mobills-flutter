import 'package:flutter/material.dart';

class MobillsButton extends StatelessWidget {
  final String text;

  MobillsButton({@required this.text}) : assert(text != null);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 15.0,
      ),
      color: Colors.blue.shade600,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      onPressed: () {},
    );
  }
}
