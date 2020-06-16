import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget getLogoPortal(BuildContext context) {
  return Padding(
    //Logo
    padding: EdgeInsets.fromLTRB(30, 1, 30, 10),
    child: Container(
      child: SvgPicture.asset(
        'assets/logos/portaldocliente.svg',
        width: MediaQuery.of(context).size.width * 0.8,
      ),
    ),
  );
}
