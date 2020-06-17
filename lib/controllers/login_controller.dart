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

  bool get isVisiblePassword => passwordVisible;

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
  // //Variávies do Controller
  // bool passwordVisible = false;
  // bool loading = false;
  // bool logged = false;
  // bool rememberMe = false;
  // String password = '';
  // String email = '';

  // void _loadUsername() async {
  //   try {
  //     SharedPreferences _prefs = await SharedPreferences.getInstance();
  //     var _username = _prefs.getString("saved_username") ?? "";
  //     var _remeberMe = _prefs.getBool("remember_me") ?? false;

  //     if (_remeberMe) {
  //       _controllerUsername.text = _username ?? "";
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void initSettings() async {
  //   // rememberMe = await _authModel.checkRememberMe();
  //   // if (rememberMe) {
  //   //   email = await _authModel.checkSavedEmail();
  //   //   emailController.text = email;
  //   // }
  //   notifyListeners();
  // }

  // //Seta Email
  // void setEmail(String _email) {
  //   email = _email;
  //   isEmailValid;
  //   isFormValid;
  //   notifyListeners();
  // }

  // bool get isEmailValid => RegExp(
  //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //     .hasMatch(email);

  // //Seta Senha
  // void setPassword(String _password) {
  //   password = _password;
  //   isPasswordValid;
  //   isFormValid;
  //   notifyListeners();
  // }

  // //Senha válida
  // bool get isPasswordValid {
  //   return password.length >= 6;
  // }

  // //Altera Visibilidade da Senha
  // void togglePasswordVisible() {
  //   passwordVisible = !passwordVisible;
  //   notifyListeners();
  // }

  // //Altera Botão de Lembrar E-mail
  // void toggleRemeberMe() {
  //   rememberMe = !rememberMe;
  //   notifyListeners();
  // }

  // //Validação do Formulário

  // //
  // Function get loginPressed {
  //   if (isEmailValid && isPasswordValid && !loading) {
  //     return login;
  //   }
  //   return null;
  // }

  // bool get isFormValid {
  //   print('Password: $isPasswordValid && Email: $isEmailValid');
  //   return isPasswordValid && isEmailValid;
  // }

  // bool get isVisiblePassword => passwordVisible;
  // bool get isRememberMe => rememberMe;
  // bool get isLogged => logged;

  // Future<void> login() async {
  //   loading = true;
  //   notifyListeners();
  //   //var result = await _authModel.login(pEmail: email, pPassword: password);
  //   loading = false;
  //   //logged = result;
  //   notifyListeners();
  // }
}
