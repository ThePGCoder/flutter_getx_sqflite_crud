import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  CustomField(
      {Key? key,
      required this.label,
      required this.icon,
      required this.textController})
      : super(key: key);
  String label;
  IconData icon;
  dynamic textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textController,
        decoration: (InputDecoration(
            prefixIcon: Icon(icon),
            labelText: label,
            border: OutlineInputBorder())),
      ),
    );
  }
}
