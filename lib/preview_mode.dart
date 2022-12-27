import 'package:flutter/material.dart';

class PreviewMode extends StatefulWidget {
  const PreviewMode({super.key});

  @override
  State<PreviewMode> createState() => _PreviewModeState();
}

class _PreviewModeState extends State<PreviewMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.green),
    );
  }
}