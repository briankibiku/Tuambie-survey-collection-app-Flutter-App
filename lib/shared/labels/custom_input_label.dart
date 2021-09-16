import 'package:flutter/material.dart';

class CustomInputLabel extends StatelessWidget {
  const CustomInputLabel({required this.labelString});
  final String labelString;
  @override
  Widget build(BuildContext context) {
    return Text(
      labelString,
      style: TextStyle(
          color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w400),
    );
  }
}

class Bold15InputLabel extends StatelessWidget {
  const Bold15InputLabel({required this.labelString, this.textColor});
  final String labelString;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      labelString,
      textAlign: TextAlign.right,
      style: TextStyle(
          color: textColor ?? Colors.black87,
          fontSize: 15,
          fontWeight: FontWeight.w600),
    );
  }
}

class Bold17InputLabel extends StatelessWidget {
  const Bold17InputLabel({required this.labelString});
  final String labelString;
  @override
  Widget build(BuildContext context) {
    return Text(
      labelString,
      textAlign: TextAlign.right,
      style: TextStyle(
          color: Colors.black87, fontSize: 17, fontWeight: FontWeight.w800),
    );
  }
}
