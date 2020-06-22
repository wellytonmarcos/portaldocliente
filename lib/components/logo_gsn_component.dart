import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoGsn extends StatelessWidget {
  double width;
  LogoGsn({this.width});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _factor = width != null ? width : 0.8;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        child: SvgPicture.asset(
          'assets/logos/gruposn.svg',
          width: _screenWidth * _factor,
        ),
      ),
    );
  }
}
