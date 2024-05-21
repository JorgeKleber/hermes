import 'package:flutter/material.dart';

class EntryWidget extends StatelessWidget {
  const EntryWidget({super.key, required this.hintText, required this.isPassword});

  final String? hintText;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: hintText
      ),
    );
  }
}
