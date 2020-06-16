import 'package:portaldocliente/models/cliente_model.dart';
import 'package:portaldocliente/services/local_storage_service.dart';

import 'cliente_model.dart';

class AuthModel {
  LocalStorageService _localStorage = LocalStorageService();
  bool isLogged = false;
  bool rememberMe = false;
  String savedEmail = "";
  ClienteModel cliente;
  AuthModel();

  Future<bool> checkLogged() async {
    return await _localStorage.get('isLogged') ?? false;
  }

  Future<bool> checkRememberMe() async {
    return await _localStorage.get('rememberMe') ?? false;
  }

  Future<String> checkSavedEmail() async {
    return await _localStorage.get('savedEmail') ?? "";
  }

  void setRememberMe(bool _rememberMe) async {
    rememberMe = _rememberMe;
    return await _localStorage.put('rememberMe', _rememberMe);
  }
}
