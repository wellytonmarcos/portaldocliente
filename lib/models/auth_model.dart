
import 'package:criar_projeto/models/cliente_model.dart';
import 'package:criar_projeto/services/local_storage_service.dart';

import 'cliente_model.dart';

class AuthModel {
  
  LocalStorageService _localStorage = LocalStorageService();
  bool isLogged = false;
  bool remeberMe = false;
  String savedEmail = "";
  ClienteModel cliente;
  AuthModel();

  Future<bool> checkLogged() async 
  {    
    return await _localStorage.get('isLogged') ?? false;
  }
}





