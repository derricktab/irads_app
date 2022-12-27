import 'package:flutter/material.dart';

displaySnackbar(BuildContext context, String message, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 20),),
      backgroundColor: Colors.green,
    ),
  );
}

