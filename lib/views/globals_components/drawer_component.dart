import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/models/auth_model.dart';
import 'package:portaldocliente/utils/circular_image_util.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  double textScaleFactor = 1;
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthModel>(context, listen: true);
    return Drawer(
      child: Container(
        color: kAccentColor,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(_auth.cliente.fotoCliente)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black45,
                      )
                    ]),
              ),
              title: CustomText(
                  _auth.cliente.nomeCliente, FontWeight.w600, kWhiteColor, 20),
              subtitle: CustomText(
                  _auth.cliente.emailCliente, FontWeight.w300, kWhiteColor, 14),
              // onTap: () {
              //   Navigator.of(context).popAndPushNamed("/myaccount");
              // },
            ),
            Divider(),
            _listDrawer(FaIcon(FontAwesomeIcons.home, color: kWhiteColor),
                "Home", "/home", context),
            _listDrawer(FaIcon(FontAwesomeIcons.newspaper, color: kWhiteColor),
                "Notícias", "/porDentroDaObra", context),
            _listDrawer(FaIcon(FontAwesomeIcons.comments, color: kWhiteColor),
                "Atendimentos", "/home", context),
            _listDrawer(FaIcon(FontAwesomeIcons.dollarSign, color: kWhiteColor),
                "Financeiro", "/financeiro", context),
            Divider(),
            _listDrawer(FaIcon(FontAwesomeIcons.question, color: kWhiteColor),
                "Ajuda", "/home", context),
            Divider(),
            _listDrawer(FaIcon(FontAwesomeIcons.signOutAlt, color: kWhiteColor),
                "Sair", "/logout", context),
          ],
        ),
      ),
    );
  }

  Widget _listDrawer(
      FaIcon icone, String title, String route, BuildContext context) {
    return ListTile(
        leading: icone,
        title: CustomText(title, FontWeight.w400, kWhiteColor, 20),
        onTap: () {
          Navigator.pushNamed(context, route);
        });
  }
}
