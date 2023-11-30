import 'package:flutter/material.dart';

class CstmTxtField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  const CstmTxtField(
      {super.key,
      this.controller,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
