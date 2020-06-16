import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/controllers/login_controller.dart';
import 'package:portaldocliente/stores/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:portaldocliente/stores/login_store.dart';
import 'package:provider/provider.dart';
import 'package:portaldocliente/utils/my_navigator_util.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:portaldocliente/views/globals_components/logo_portal_component.dart';

import 'custom_icon_button_widget.dart';
import 'custom_text_field_widget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController _loginController = LoginController();
  LoginStore loginStore = LoginStore();

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController.initSettings();
  }

  @override
  Widget build(BuildContext context) {
    var authStore = Provider.of<AuthStore>(context);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).copyWith().size.height - 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            getLogoPortal(context),
                            ListTile(title: Observer(builder: (_) {
                              return CustomTextField(
                                hint: 'E-mail',
                                prefix: Icon(Icons.account_circle),
                                textInputType: TextInputType.emailAddress,
                                onChanged: loginStore.setEmail,
                                enabled: true,
                                controller: _loginController.emailController,
                                defaultValue: loginStore.email,
                              );
                            })),
                            ListTile(
                              title: Observer(builder: (_) {
                                return CustomTextField(
                                  hint: 'Senha',
                                  prefix: Icon(Icons.lock),
                                  obscure: !loginStore.isVisiblePassword,
                                  onChanged: loginStore.setPassword,
                                  enabled: true,
                                  suffix: CustomIconButton(
                                    radius: 32,
                                    iconData: Icons.visibility,
                                    onTap: loginStore.togglePasswordVisible,
                                  ),
                                  controller:
                                      _loginController.passwordController,
                                  defaultValue: loginStore.password,
                                );
                              }),
                            ),
                            ListTile(
                              title: CustomText('Salvar e-mail',
                                  FontWeight.w500, kPrimaryColor, 18),
                              trailing: Observer(
                                builder: (_) {
                                  return Switch.adaptive(
                                    activeColor: kPrimaryColor,
                                    onChanged: (bool value) {
                                      _loginController.toggleRememberMe(value);
                                    },
                                    value: loginStore.isRememberMe,
                                  );
                                },
                              ),
                            ),
                            ListTile(
                              title: Observer(builder: (_) {
                                return SizedBox(
                                  height: 44,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: loginStore.loading
                                          ? CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation(
                                                      Colors.white),
                                            )
                                          : CustomText('Login', FontWeight.w500,
                                              kWhiteColor, 18),
                                      color: kPrimaryColor,
                                      disabledColor:
                                          kPrimaryColor.withAlpha(100),
                                      textColor: Colors.white,
                                      onPressed: loginStore.loginPressed),
                                );
                              }),
                            ),
                            Padding(
                              //Logo
                              padding: EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                'assets/logos/gruposn.svg',
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
