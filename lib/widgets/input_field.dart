import 'package:flutter/material.dart';
import 'package:eccofficiel/theme.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Widget suffixIcon;
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    required this.suffixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: textWhiteGrey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          isDense: true,
          hintText: hintText,
          hintStyle: heading6.copyWith(color: textGrey),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
