import 'package:flutter/material.dart';
import 'package:portaldocliente/components/custom_btn_component.dart';
import 'package:portaldocliente/components/logo_gsn_component.dart';
import 'package:portaldocliente/components/logo_portal_component.dart';
import 'package:portaldocliente/themes/custom_theme.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';

import 'custom_icon_button_widget.dart';
import 'custom_text_form_field_widget.dart';

class LoginView extends StatelessWidget {
  double _screenWidth;
  double _screenHeight;
  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              height: _screenHeight - 30,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            LogoPortal(
                              width: 0.8,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CustomTextFormField(
                              hint: 'E-mail',
                              prefix: Icon(Icons.account_circle),
                              textInputType: TextInputType.emailAddress,
                              enabled: true,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            CustomTextFormField(
                              hint: 'Senha',
                              prefix: Icon(Icons.lock),
                              obscure: true, //_auth.hiddenPassword,
                              enabled: true,
                              suffix: CustomIconButton(
                                  radius: 32,
                                  iconData: Icons.visibility,
                                  onTap: () {} //_auth.handleHiddenPassword
                                  ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ListTile(
                              title: CustomText('Salvar e-mail',
                                  FontWeight.w500, kPrimaryColor, 18),
                              trailing: Switch.adaptive(
                                  activeColor: kPrimaryColor,
                                  onChanged: (val) {}, //_auth.handleRememberMe,
                                  value: true // _auth.rememberMe,
                                  ),
                            ),
                            CustomRaisedButton(
                              text: 'Login',
                              callback: () {},
                              width: _screenWidth * 1,
                            ),
                            LogoGsn(
                              width: 0.3,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
