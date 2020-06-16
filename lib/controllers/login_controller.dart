import 'package:flutter/cupertino.dart';
import 'package:portaldocliente/models/auth_model.dart';
import 'package:portaldocliente/stores/login_store.dart';

class LoginController {
  AuthModel _authModel = AuthModel();
  LoginStore _loginStore = LoginStore();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void initSettings() async {
    var _remeberMe = await _authModel.checkRememberMe();
    _loginStore.setRememberMe(_remeberMe);
    if (_remeberMe) {
      var _email = await _authModel.checkSavedEmail();
      _loginStore.setEmail(_email);
    }
    print('Remember me $_remeberMe');
  }

  void toggleRememberMe(bool _rememberMe) {
    _loginStore.toggleRemeberMe();
    // _loginStore.setRememberMe(_rememberMe);
    // await _authModel.setRememberMe(_rememberMe);
  }
}
