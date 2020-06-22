import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portaldocliente/models/boleto_model.dart';
import 'dart:async';

import 'package:portaldocliente/models/por_dentro_da_obra_model.dart';
import 'package:portaldocliente/themes/custom_theme.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:portaldocliente/utils/tile_section_widget.dart';
import 'package:portaldocliente/views/globals_components/drawer_component.dart';
import 'package:portaldocliente/views/noticias/pdo/pdo_detail_page.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  PorDentroDaObraModel pdomodel = PorDentroDaObraModel();
  BoletoModel boletomodel = BoletoModel();

  @override
  void initState() {
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: AppDrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.alignCenter,
                size: 25, color: kPrimaryColor),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
            padding: EdgeInsets.only(left: 8),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomText('portal do ', FontWeight.w300, kAccentColor, 30),
              CustomText('cliente', FontWeight.w900, kPrimaryColor, 30),
              Padding(
                padding: EdgeInsets.only(right: 40),
              )
            ],
          ),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 24, top: 15, bottom: 16),
                child: CustomText(
                    'Olá Wellyton!', FontWeight.w500, kPrimaryColor, 30),
              ),
              // Last Transaction Section
              TileSection('Meu Apê', 'Trocar', context, null),
              _empreendimentoContainer(),
              TileSection('Por Dentro da Obra', 'Ver Mais', context,
                  '/porDentroDaObra'),
              Container(
                height: 160,
                child: FutureBuilder(
                    future: pdomodel.getLastsPdo(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Padding(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Container(
                              width: 200.0,
                              height: 180.0,
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
                                    'Carregando por Dentro da Obra',
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
                            return _pdoContainer(context, snapshot);
                          }
                      }
                    }),
              ),
              TileSection(
                  'Boletos Disponíveis', 'Ver Tudo', context, '/financeiro'),
              Container(
                //height: 390,
                child: FutureBuilder(
                    future: boletomodel.getLastsBoletos(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Padding(
                            padding: EdgeInsets.only(left: 24, right: 24),
                            child: Container(
                              width: 200.0,
                              //height: 180.0,
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
                                    'Carregando Boletos',
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
                            return _boletoContainer(context, snapshot);
                          }
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Text('Portal do Cliente'),
                ),
              )
            ],
          ),
        ));
  }

  Widget _buttonMenu(String nameBotton, String tooltipBotton, IconData icon,
      BuildContext context, String route) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kAccentColor),
          boxShadow: [
            BoxShadow(
                color: Color(0x10000000),
                blurRadius: 10,
                spreadRadius: 4,
                offset: Offset(0.0, 8.0))
          ],
          color: kWhiteColor,
        ),
        child: Column(children: <Widget>[
          IconButton(
            icon: FaIcon(icon, size: 28, color: kAccentColor),
            tooltip: tooltipBotton,
            onPressed: () {
              Navigator.pushNamed(context, route);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              height: 30,
              child: Center(
                child: Text(
                  nameBotton,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: kAccentColor,
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _pdoContainer(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 24, right: 8),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data["data"].length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        (pdoSelectedView(snapshot.data["data"][index]))));
          },
          child: Container(
            margin: EdgeInsets.only(right: 8),
            height: 160,
            width: 220,
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
                image:
                    NetworkImage(snapshot.data["data"][index]["miniImgPath"]),
                fit: BoxFit.cover,
                colorFilter:
                    new ColorFilter.mode(kAccentColor, BlendMode.modulate),
              ),
              color: kAccentColor,
            ),
            child: Stack(children: <Widget>[
              Positioned(
                left: 16,
                top: 12,
                child: Image.network(
                  snapshot.data["data"][index]["empImgPath"],
                  width: 30,
                  height: 30,
                ),
              ),
              Positioned(
                top: 14,
                right: 12,
                child: Text(
                  '',
                  style: GoogleFonts.nunito(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kAccentColor),
                ),
              ),
              Positioned(
                top: 63,
                left: 16,
                child: Text(
                  snapshot.data["data"][index]["year"],
                  style: GoogleFonts.nunito(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
              ),
              Positioned(
                left: 16,
                top: 81,
                child: Text(
                  snapshot.data["data"][index]["month"],
                  style: GoogleFonts.nunito(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: kWhiteColor),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 12,
                child: Text(
                  snapshot.data["data"][index]["created"],
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: kOrangeColor),
                ),
              ),
              Positioned(
                right: 8,
                bottom: 8,
                child: Icon(Icons.more),
              )
            ]),
          ),
        );
      },
    );
  }

  Widget _boletoContainer(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      padding: EdgeInsets.only(left: 24, right: 24),
      primary: false,
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
              color: snapshot.data["data"][index]['isVencido'] == "1"
                  ? Colors.red.withAlpha(100)
                  : kWhiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Vencimento: ' +
                            snapshot.data["data"][index]['dataVencimento'],
                        style: GoogleFonts.nunito(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color:
                                snapshot.data["data"][index]['isVencido'] == "1"
                                    ? Colors.red
                                    : kAccentColor),
                      ),
                      Text(
                        snapshot.data["data"][index]['valor'],
                        style: GoogleFonts.nunito(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color:
                                snapshot.data["data"][index]['isVencido'] == "1"
                                    ? Colors.redAccent
                                    : kAccentColor),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.barcode,
                      color: Colors.green,
                    ),
                    tooltip: 'Copiar código de barras',
                    onPressed: () {
                      _showDialogInfo(
                          FaIcon(FontAwesomeIcons.barcode,
                              size: 55, color: kAccentColor),
                          'Copiado!',
                          'O código \n' +
                              snapshot.data["data"][index]['codigoBarra'] +
                              ' foi copiado para área de transferência');
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.envelope,
                      color: Colors.blue,
                    ),
                    tooltip: 'Enviar Boleto por E-mail',
                    onPressed: () {
                      _showDialogInfo(
                          FaIcon(FontAwesomeIcons.envelope,
                              size: 55, color: kAccentColor),
                          'Enviado!',
                          'Enviamos o boleto para seu e-mail, caso não receba em 5 minutos, contate nosso suporte!');
                    },
                  ),
                  IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.filePdf,
                      color: Colors.red,
                    ),
                    tooltip: 'Fazer Download',
                    onPressed: () {
                      _showDialogInfo(
                          FaIcon(FontAwesomeIcons.envelope,
                              size: 55, color: kAccentColor),
                          'Aguarde!',
                          'Estamos gerando o boleto, aguarde um momento!');
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

  Future<void> _showDialogInfo(FaIcon icone, String title, String content) {
    return showDialog(
        context: context,
        child: new AlertDialog(
          title: Column(
            children: <Widget>[
              icone,
              Text(title,
                  style: GoogleFonts.nunito(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: kAccentColor)),
            ],
          ),
          content: Text(content,
              textAlign: TextAlign.center,
              style: GoogleFonts.nunito(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: kAccentColor)),
        ));
  }

  Widget _empreendimentoContainer() {
    return Container(
      margin: EdgeInsets.only(left: 24, top: 0, bottom: 15, right: 24),
      height: 120,
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
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 1,
            right: 1,
            top: 5,
            height: 80,
            child: Image.asset(
              'assets/images/reservadosol_h.png',
              width: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          Positioned(
            top: 90,
            left: 16,
            child: Text(
              'Bloco/Quadra: A',
              style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kAccentColor),
            ),
          ),
          Positioned(
            right: 16,
            top: 90,
            child: Text(
              'Unidade/Lote: 000106',
              style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: kAccentColor),
            ),
          ),
        ],
      ),
    );
  }
}
