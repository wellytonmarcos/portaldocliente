import 'package:portaldocliente/models/auth_model.dart';
import 'package:portaldocliente/stores/auth_store.dart';

class SplashController {
  AuthModel _authModel = AuthModel();
  AuthStore _authStore = AuthStore();
  // Future<bool> isLogged() async {
  //   var _isLogged = await _authModel.checkLogged();
  //   _authStore.setLogged(_isLogged);
  //   return _isLogged;
  // }
}
