import 'package:portaldocliente/models/cliente_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  bool isLogged = false;

  @observable
  ClienteModel cliente = null;

  @action
  void setLogged(bool _isLogged) => isLogged = _isLogged;
}
