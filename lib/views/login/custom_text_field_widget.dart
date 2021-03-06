import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portaldocliente/constants/colors_constants.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.obscure = false,
      this.textInputType,
      this.onChanged,
      this.enabled,
      this.controller,
      this.defaultValue});

  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;
  final String defaultValue;

  @override
  Widget build(BuildContext context) {
    //controller.text = defaultValue ?? "";
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(32),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        style: GoogleFonts.nunito(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: kAccentColor,
        ),
        decoration: InputDecoration(
          labelText: hint,
          labelStyle: GoogleFonts.nunito(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: kAccentColor,
          ),
          focusColor: kAccentColor,
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
