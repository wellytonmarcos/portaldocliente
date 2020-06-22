import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portaldocliente/themes/custom_theme.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.obscure = false,
      this.textInputType,
      this.onSaved,
      this.onChanged,
      this.enabled,
      this.controller,
      this.validate});

  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onSaved;
  final Function(String) onChanged;
  final Function(String) validate;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(32),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onSaved: onSaved,
        enabled: enabled,
        validator: (val) => val.length < 1 ? 'Username Required' : null,
        autocorrect: false,
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
