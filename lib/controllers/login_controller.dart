import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portaldocliente/constants/colors_constants.dart';
import 'package:portaldocliente/models/auth_model.dart';
import 'package:portaldocliente/utils/custom_text_util.dart';
import 'package:portaldocliente/utils/my_navigator_util.dart';
import 'package:portaldocliente/utils/pop_up_util.dart';

class LoginController extends ChangeNotifier {
  //Model de Autenticação

  String email = "";
  String password = "";
  String status = 'no-action';
  bool passwordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void setEmail(String _email) {
    emailController.text = _email;
    email = _email;
    notifyListeners();
  }

  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  void setPassword(String _password) {
    passwordController.text = _password;
    password = _password;
    notifyListeners();
  }

  bool get isPasswordValid {
    return password.length > 6;
  }

  bool get isVisiblePassword {
    notifyListeners();
    return passwordVisible;
  }

  void togglePasswordVisible() {
    passwordVisible = !passwordVisible;
    print(passwordVisible);
    notifyListeners();
  }

  void doLogin(BuildContext context, AuthModel _auth) {
    password = passwordController.text;
    email = emailController.text;
    scaffoldKey.currentState.hideCurrentSnackBar();
    if (!isEmailValid) {
      final snackbar = SnackBar(
        duration: Duration(seconds: 30),
        content: Row(
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.exclamationCircle,
              color: kOrangeColor,
            ),
            SizedBox(
              width: 12,
            ),
            CustomText("E-mail inválido!", FontWeight.w400, kWhiteColor, 18),
          ],
        ),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    } else if (!isPasswordValid) {
      final snackbar = SnackBar(
        duration: Duration(seconds: 10),
        content: Row(
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.exclamationCircle,
              color: kOrangeColor,
            ),
            SizedBox(
              width: 12,
            ),
            CustomText("Senha inválida!", FontWeight.w400, kWhiteColor, 18),
          ],
        ),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        duration: Duration(minutes: 2),
        content: Row(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(
              width: 12,
            ),
            CustomText("Fazendo Login", FontWeight.w400, kWhiteColor, 18),
          ],
        ),
      );
      scaffoldKey.currentState.showSnackBar(snackbar);
      _auth
          .login(email: emailController.text, password: passwordController.text)
          .then((result) {
        print(result);
        if (result) {
          MyNavigator.goToHome(context);
        } else {
          status = 'rejected';
          showAlertPopup(context, 'Atenção!', _auth.errorMessage);
        }
        scaffoldKey.currentState.hideCurrentSnackBar();
      });
    }
  }
}
