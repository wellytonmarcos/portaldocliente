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
  bool _hiddenPassword = true;
  bool _stayLoggedIn = true;
  bool _useBio = false;
  String _savedEmail = "";
  ClienteModel _cliente;

  /** Toggle de Salvar */
  bool get rememberMe => _rememberMe;

  void handleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
    _localStorage.put('remember_me', value);
  }

  /** Toggle de Hidden Passorwd */
  bool get hiddenPassword => _hiddenPassword;

  void handleHiddenPassword() {
    _hiddenPassword = !_hiddenPassword;
    notifyListeners();
  }

  /** Usar Biometria */
  String get savedEmail => _savedEmail;

  void saveEmail(String value) {
    _savedEmail = value;
    notifyListeners();
    _localStorage.put('saved_email', value);
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
      _useBio = await _localStorage.get("use_bio") ?? false;
    } catch (e) {
      print('Excessão em usar Biometria $e');
      _useBio = false;
    }
    try {
      _savedEmail = await _localStorage.get("saved_email") ?? false;
    } catch (e) {
      print('Excessão de email salvo $e');
      _useBio = false;
    }
    try {
      _rememberMe = await _localStorage.get("remember_me") ?? false;
    } catch (e) {
      print('Excessão em lembrar me $e');
      _rememberMe = false;
    }
    try {
      _stayLoggedIn = await _localStorage.get("stay_logged_in") ?? false;
    } catch (e) {
      print('Excessão em permanecer logado $e');
      _stayLoggedIn = false;
    }

    if (_stayLoggedIn) {
      ClienteModel _savedCliente;
      try {
        String _saved = await _localStorage.get("cliente_data");
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
        "cgccfoCliente": '083.679.476-14',
        "emailCliente": 'wellytonmarcos@gmail.com',
        "nomeCliente": 'Wellyton Marcos Silva de Oliveira',
        "fotoCliente":
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRwg9kLDjbiE5BHUms0c4H0Qq-9Erq4FKNI9pUfbzkPez08FxBZ&usqp=CAU',
        "password": '123456',
        "tentativas": 1,
        "lastLogin": 'this.lastLogin',
        "termoAceiteCliente": true,
        "token": 'this.token',
        "refreshToken": 'this.refreshToken'
      });
      return _newCliente.emailCliente == email ? _newCliente : null;
      //_newCliente?.emailCliente == email;
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
    if (_rememberMe) {
      _localStorage.put('saved_email', _email);
    }
    _localStorage.put('stay_logged_in', true);
    // Get Info For User
    ClienteModel _newCliente = await getInfo(_email);
    if (_newCliente != null) {
      _cliente = _newCliente;

      notifyListeners();
      var _save = json.encode(_cliente.toJson());
      print("Dados do Cliente a serem salvos: $_save");
      _localStorage.put("cliente_data", _save);
    }
    errorMessage = "Não foi possível conectar com o e-mail informado!";
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
