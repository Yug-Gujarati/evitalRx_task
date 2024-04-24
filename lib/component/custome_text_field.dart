import 'package:flutter/material.dart';

enum KeyboardType {
  text,
  number,
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final IconData? icon;
  final String? Function(String?)? validator;
  final String errortext;
  final KeyboardType keyboardType;

  CustomTextField({
    Key? key,
    this.controller,
    required this.hintText,
    this.icon,
    this.validator,
    this.keyboardType = KeyboardType.text,
    required this.errortext,
  }) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.blue[900],
      controller: controller,
      keyboardType: _getKeyboardType(keyboardType),
      validator: validator,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.only(top: 1, bottom: 1),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blue[900], fontSize: 14),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Icon(
            icon,
            color: Colors.blue[900],
            size: 20,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _formKey.currentState?.validate() == false ? Colors.red : const Color.fromARGB(255, 13, 71, 161),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: _formKey.currentState?.validate() == false ? Colors.red : const Color.fromARGB(255, 13, 71, 161),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _formKey.currentState?.validate() == false ? Colors.red : const Color.fromARGB(255, 13, 71, 161),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: const Color.fromARGB(255, 13, 71, 161),
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        errorText: _formKey.currentState?.validate() == false ? errortext : null,
      ),
    );
  }

  TextInputType _getKeyboardType(KeyboardType keyboardType) {
    switch (keyboardType) {
      case KeyboardType.text:
        return TextInputType.text;
      case KeyboardType.number:
        return TextInputType.number;
      default:
        return TextInputType.text;
    }
  }
}
