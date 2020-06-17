import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/controllers/login_controller.dart';
import 'package:portaldocliente/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:portaldocliente/utils/pop_up_util.dart';
import 'package:portaldocliente/views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:portaldocliente/utils/my_navigator_util.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:portaldocliente/views/globals_components/logo_portal_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_icon_button_widget.dart';
import 'custom_text_form_field_widget.dart';

class LoginView extends StatefulWidget {
  LoginView({this.email});

  final String email;

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController _loginController = LoginController();

  @override
  initState() {
    _loginController.setEmail(widget?.email ?? "");
    _loadEmail();
    super.initState();
  }

  void _loadEmail() async {
    // try {
    //   SharedPreferences _prefs = await SharedPreferences.getInstance();
    //   var _username = _prefs.getString("saved_email") ?? "";
    //   var _remeberMe = _prefs.getBool("remember_me") ?? false;

    //   if (_remeberMe) {
    //     _loginController.setEmail(_username ?? "");
    //   }
    // } catch (e) {
    //   print(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthModel>(context, listen: true);
    if (_auth.rememberMe) {
      _loginController.setEmail(_auth.savedEmail);
    }
    return SafeArea(
      child: Scaffold(
        key: _loginController.scaffoldKey,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).copyWith().size.height - 30,
                child: Form(
                  key: _loginController.formKey,
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
                              ListTile(
                                title: CustomTextFormField(
                                  hint: 'E-mail',
                                  prefix: Icon(Icons.account_circle),
                                  textInputType: TextInputType.emailAddress,
                                  enabled: true,
                                  controller: _loginController.emailController,
                                ),
                              ),
                              ListTile(
                                title: CustomTextFormField(
                                  hint: 'Senha',
                                  prefix: Icon(Icons.lock),
                                  obscure: !_loginController.isVisiblePassword,
                                  enabled: true,
                                  suffix: CustomIconButton(
                                      radius: 32,
                                      iconData: Icons.visibility,
                                      onTap: () {}),
                                  controller:
                                      _loginController.passwordController,
                                ),
                              ),
                              ListTile(
                                title: CustomText('Salvar e-mail',
                                    FontWeight.w500, kPrimaryColor, 18),
                                trailing: Switch.adaptive(
                                    activeColor: kPrimaryColor,
                                    onChanged: (bool value) {
                                      //loginController.toggleRemeberMe();
                                    },
                                    value: true // loginController.isRememberMe,
                                    ),
                              ),
                              ListTile(
                                title: SizedBox(
                                  height: 44,
                                  child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: CustomText('Login',
                                          FontWeight.w500, kWhiteColor, 18),
                                      color: kPrimaryColor,
                                      disabledColor:
                                          kPrimaryColor.withAlpha(100),
                                      textColor: Colors.white,
                                      onPressed: () {
                                        _loginController.doLogin(
                                            context, _auth);
                                      }),
                                ),
                              ),
                              Padding(
                                //Logo
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                  'assets/logos/gruposn.svg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
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
            ),
          ],
        ),
      ),
    );
  }
}
