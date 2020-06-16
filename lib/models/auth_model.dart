import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:portaldocliente/models/cliente_model.dart';
import 'package:portaldocliente/services/local_storage_service.dart';

import 'cliente_model.dart';

class AuthModel extends ChangeNotifier {
  LocalStorageService _localStorage = LocalStorageService();

  String errorMessage = "";

  bool _rememberMe = false;
  bool _stayLoggedIn = true;
  bool _useBio = false;
  ClienteModel _cliente;

  /** Toggle de Salvar */
  bool get rememberMe => _rememberMe;

  void handleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
    _localStorage.put('remember_me', value);
  }

  /** Usar Biometria */
  bool get isBioSetup => _useBio;

  void handleIsBioSetup(bool value) {
    _useBio = value;
    notifyListeners();
    _localStorage.put('use_bio', value);
  }

  /** Sistema de Biometria */
  Future<bool> biometrics() async {
    final LocalAuthentication auth = LocalAuthentication();
    bool authenticated = false;
    try {
      authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Escaneie sua impressão digital',
          useErrorDialogs: true,
          stickyAuth: false);
    } catch (e) {
      print("Erro ao ler impressão: $e");
    }
    return authenticated;
  }

  /** Continuar Logado */
  bool get stayLoggedIn => _stayLoggedIn;

  void handleStayLoggedIn(bool value) {
    _stayLoggedIn = value;
    notifyListeners();
    _localStorage.put('stay_logged_in', value);
  }

  /** Carregar Configurações */
  void loadSettings() async {
    try {
      _useBio = _localStorage.get("use_bio") ?? false;
    } catch (e) {
      print('Excessão em usar Biometria $e');
      _useBio = false;
    }
    try {
      _rememberMe = _localStorage.get("remember_me") ?? false;
    } catch (e) {
      print('Excessão em lembrar me $e');
      _rememberMe = false;
    }
    try {
      _stayLoggedIn = _localStorage.get("stay_logged_in") ?? false;
    } catch (e) {
      print('Excessão em permanecer logado $e');
      _stayLoggedIn = false;
    }

    if (_stayLoggedIn) {
      ClienteModel _savedCliente;
      try {
        String _saved = _localStorage.get("cliente_data") as String;
        print("Cliente Salvo: $_saved");
        _savedCliente = ClienteModel.fromJson(json.decode(_saved));
      } catch (e) {
        print("Cliente não encontrado: $e");
      }
      if (!kIsWeb && _useBio) {
        if (await biometrics()) {
          _cliente = _savedCliente;
        }
      } else {
        _cliente = _savedCliente;
      }
    }
    notifyListeners();
  }

  ClienteModel get cliente => _cliente;

  Future<ClienteModel> getInfo(String email) async {
    try {
      //var _data = await http.get(apiURL);
      // var _json = json.decode(json.encode(_data));
      //var _newUser = User.fromJson(json.decode(_data.body)["data"]);
      ClienteModel _newCliente = ClienteModel.fromJson({
        "idCliente": 1,
        "cgcCfo": '083.679.476-14',
        "email": 'wellytonmarcos@gmail.com',
        "nome": 'Wellyton Marcos Silva de Oliveira',
        "foto":
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwg9kLDjbiE5BHUms0c4H0Qq-9Erq4FKNI9pUfbzkPez08FxBZ&usqp=CAU',
        "password": '123456',
        "tentativas": 1,
        "lastLogin": 'this.lastLogin',
        "aceiteTermo": true,
        "token": 'this.token',
        "refreshToken": 'this.refreshToken'
      });
      _newCliente?.emailCliente = email;
      return _newCliente;
    } catch (e) {
      print("Não foi possivel retornar os dados do cliente: $e");
      return null;
    }
  }

  Future<bool> login({
    @required String email,
    @required String password,
  }) async {
    String _email = email;
    String _password = password;

    // TODO: API LOGIN CODE HERE
    await Future.delayed(Duration(seconds: 3));
    print("Logging In => $_email, $_password");

    if (_rememberMe) {
      _localStorage.put('saved_email', _email);
    }

    // Get Info For User
    ClienteModel _newCliente = await getInfo(_email);
    if (_newCliente != null) {
      _cliente = _newCliente;
      notifyListeners();

      _localStorage.get('saved_cliente').then((prefs) {
        var _save = json.encode(_cliente.toJson());
        print("Dados do Cliente: $_save");
        _localStorage.put("cliente_data", _save);
      });
    }

    if (_newCliente?.token == null || _newCliente.token.isEmpty) return false;
    return true;
  }

  Future<void> logout() async {
    _cliente = null;
    notifyListeners();

    _localStorage.put("cliente_data", null);

    return;
  }
}
