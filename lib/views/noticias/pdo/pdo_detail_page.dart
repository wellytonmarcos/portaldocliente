import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portaldocliente/themes/custom_theme.dart';

class pdoSelectedView extends StatelessWidget {
  final Map _pdoData;

  pdoSelectedView(this._pdoData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Por Dentro da Obra',
            style: GoogleFonts.nunito(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: kAccentColor,
            ),
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.angleLeft, color: kAccentColor),
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.only(left: 8),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Image.network(_pdoData["imgPath"]),
          ),
        ));
  }
}
