// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$isLoggedAtom = Atom(name: '_AuthStore.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$clienteAtom = Atom(name: '_AuthStore.cliente');

  @override
  ClienteModel get cliente {
    _$clienteAtom.reportRead();
    return super.cliente;
  }

  @override
  set cliente(ClienteModel value) {
    _$clienteAtom.reportWrite(value, super.cliente, () {
      super.cliente = value;
    });
  }

  final _$_AuthStoreActionController = ActionController(name: '_AuthStore');

  @override
  void setLogged(bool _isLogged) {
    final _$actionInfo =
        _$_AuthStoreActionController.startAction(name: '_AuthStore.setLogged');
    try {
      return super.setLogged(_isLogged);
    } finally {
      _$_AuthStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLogged: ${isLogged},
cliente: ${cliente}
    ''';
  }
}
