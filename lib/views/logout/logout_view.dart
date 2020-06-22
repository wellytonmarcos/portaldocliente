import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:portaldocliente/controllers/splash_controller.dart';
import 'package:portaldocliente/models/auth_model.dart';
import 'package:portaldocliente/themes/custom_theme.dart';
import 'package:portaldocliente/utils/my_navigator_util.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:portaldocliente/views/globals_components/logo_portal_component.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LogoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthModel>(builder: (context, _auth, widget) {
      return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: kBackgroundColor),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        getLogoPortal(context),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText("Tem certeza que deseja sair?",
                            FontWeight.w400, kPrimaryColor, 20),
                        SizedBox(height: 40),
                        ListTile(
                          title: SizedBox(
                            height: 44,
                            child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: CustomText(
                                    'Sair', FontWeight.w500, kWhiteColor, 18),
                                color: kPrimaryColor,
                                disabledColor: kPrimaryColor.withAlpha(100),
                                textColor: Colors.white,
                                onPressed: () {
                                  _auth.logout();
                                  MyNavigator.goToLogin(context);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
