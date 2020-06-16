import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/controllers/login_controller.dart';
import 'package:portaldocliente/models/auth_model.dart';
import 'package:portaldocliente/stores/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:portaldocliente/views/home/home_view.dart';
import 'package:provider/provider.dart';
import 'package:portaldocliente/utils/my_navigator_util.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:portaldocliente/views/globals_components/logo_portal_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'custom_icon_button_widget.dart';
import 'custom_text_field_widget.dart';

class LoginView extends StatefulWidget {
  LoginView({this.email});

  final String email;

  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String _status = 'no-action';
  String _email, _password;

  final formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _controllerUsername, _controllerPassword;

  @override
  initState() {
    _controllerUsername = TextEditingController(text: widget?.email ?? "");
    _controllerPassword = TextEditingController();
    _loadUsername();
    super.initState();
    print(_status);
  }

  void _loadUsername() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _username = _prefs.getString("saved_username") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;

      if (_remeberMe) {
        _controllerUsername.text = _username ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  _irH(BuildContext context) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => HomeView()));
  }

  //https://github.com/rodydavis/flutter_login/blob/master/lib/ui/signin/signin.dart
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthModel>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Consumer<LoginController>(
            builder: (context, loginController, widget) {
          //loginController.initSettings();
          return Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).copyWith().size.height - 30,
                  child: Form(
                    key: formKey,
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
                                    title: CustomTextField(
                                  hint: 'E-mail',
                                  prefix: Icon(Icons.account_circle),
                                  textInputType: TextInputType.emailAddress,
                                  //onChanged: loginController.setEmail,
                                  enabled: true,
                                  // controller: _loginController.emailController,
                                  // defaultValue: _loginController.email,
                                )),
                                ListTile(
                                  title: CustomTextField(
                                    hint: 'Senha',
                                    prefix: Icon(Icons.lock),
                                    // obscure: !loginController.isVisiblePassword,
                                    // onChanged: loginController.setPassword,
                                    enabled: true,
                                    suffix: CustomIconButton(
                                        radius: 32,
                                        iconData: Icons.visibility,
                                        onTap: () {}
                                        //loginController.togglePasswordVisible,
                                        ),
                                    // controller:
                                    //     _loginController.passwordController,
                                    // defaultValue: _loginController.password,
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
                                      value:
                                          true // loginController.isRememberMe,
                                      ),
                                ),
                                ListTile(
                                  title: SizedBox(
                                    height: 44,
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        child: true //loginController.loading
                                            ? CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation(
                                                        Colors.white),
                                              )
                                            : CustomText(
                                                'Login',
                                                FontWeight.w500,
                                                kWhiteColor,
                                                18),
                                        color: kPrimaryColor,
                                        disabledColor:
                                            kPrimaryColor.withAlpha(100),
                                        textColor: Colors.white,
                                        onPressed:
                                            true //!loginController.isFormValid
                                                ? null
                                                : _irH(context)),
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
          );
        }),
      ),
    );
  }
}
