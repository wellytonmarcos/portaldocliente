import 'package:flutter/material.dart';
import 'package:portaldocliente/models/auth_model.dart';

class LoginController extends ChangeNotifier {
  //Model de Autenticação
  AuthModel _authModel = AuthModel();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
