import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText(this.name, this.fw, this.color, this.size);
  final String name;
  final FontWeight fw;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: GoogleFonts.nunito(
        fontSize: size,
        fontWeight: fw,
        color: color,
      ),
    );
  }
}
