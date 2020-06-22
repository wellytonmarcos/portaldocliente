import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoPortal extends StatelessWidget {
  double width;
  LogoPortal({this.width});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _factor = width != null ? width : 0.8;
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 1, 30, 10),
      child: Container(
        child: SvgPicture.asset(
          'assets/logos/portaldocliente.svg',
          width: _screenWidth * _factor,
        ),
      ),
    );
  }
}
