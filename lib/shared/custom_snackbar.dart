import 'package:flutter/material.dart';

customSnackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
}
