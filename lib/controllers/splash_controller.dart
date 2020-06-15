import 'package:criar_projeto/models/auth_model.dart';
import 'package:criar_projeto/stores/auth_store.dart';

class SplashController{
  
  AuthModel _authModel = AuthModel();
  AuthStore _authStore = AuthStore();
  Future<bool> isLogged() async
  {
    var _isLogged = await _authModel.checkLogged();
    _authStore.setLogged(_isLogged);
    return _isLogged;
  }
}