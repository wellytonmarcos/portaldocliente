import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/svg.dart';

import 'package:portaldocliente/models/por_dentro_da_obra_model.dart';
import 'package:portaldocliente/themes/custom_theme.dart';
import 'package:portaldocliente/views/noticias/pdo/pdo_detail_page.dart';

class PdoListView extends StatelessWidget {
  PorDentroDaObraModel pdomodel = PorDentroDaObraModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        centerTitle: true,
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
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: SvgPicture.asset(
                'assets/svg/pdo.svg',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                'Acompanhe a evolução da obra do seu sonho.',
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: kAccentColor,
                ),
              ),
            ),
            FutureBuilder(
                future: pdomodel.getLastsPdo(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x10000000),
                                  blurRadius: 10,
                                  spreadRadius: 4,
                                  offset: Offset(0.0, 8.0))
                            ],
                            color: kWhiteColor,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 60, 0, 20),
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      kAccentColor),
                                  strokeWidth: 5.0,
                                ),
                              ),
                              Text(
                                'Carregando Por Dentro da Obra',
                                style: TextStyle(
                                    color: kAccentColor, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Container();
                      } else {
                        return _pdoList(context, snapshot);
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget _pdoList(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 24, right: 24),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data["data"].length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 8),
          height: 68,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                    color: Color(0x04000000),
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(0.0, 8.0))
              ],
              color: kWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    height: 68,
                    width: 68,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 10,
                            spreadRadius: 4,
                            offset: Offset(0.0, 8.0))
                      ],
                      image: DecorationImage(
                        image: NetworkImage(
                            snapshot.data["data"][index]["miniImgPath"]),
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            kAccentColor, BlendMode.modulate),
                      ),
                      color: kAccentColor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        snapshot.data["data"][index]["year"],
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: kAccentColor),
                      ),
                      Text(
                        snapshot.data["data"][index]["month"],
                        style: GoogleFonts.nunito(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: kAccentColor),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.angleRight,
                        color: kAccentColor),
                    tooltip: 'Copiar código de barras',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => (pdoSelectedView(
                                  snapshot.data["data"][index]))));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
