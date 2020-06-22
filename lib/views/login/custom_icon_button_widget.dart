import 'package:flutter/material.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/themes/custom_theme.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({this.radius, this.iconData, this.onTap});

  final double radius;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Icon(iconData, color: kPrimaryColor),
          onTap: onTap,
        ),
      ),
    );
  }
}
