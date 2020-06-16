// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginStore.isPasswordValid'))
          .value;
  Computed<Function> _$loginPressedComputed;

  @override
  Function get loginPressed =>
      (_$loginPressedComputed ??= Computed<Function>(() => super.loginPressed,
              name: '_LoginStore.loginPressed'))
          .value;
  Computed<bool> _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginStore.isEmailValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;
  Computed<bool> _$isVisiblePasswordComputed;

  @override
  bool get isVisiblePassword => (_$isVisiblePasswordComputed ??= Computed<bool>(
          () => super.isVisiblePassword,
          name: '_LoginStore.isVisiblePassword'))
      .value;
  Computed<bool> _$isRememberMeComputed;

  @override
  bool get isRememberMe =>
      (_$isRememberMeComputed ??= Computed<bool>(() => super.isRememberMe,
              name: '_LoginStore.isRememberMe'))
          .value;

  final _$rememberMeAtom = Atom(name: '_LoginStore.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordVisibleAtom = Atom(name: '_LoginStore.passwordVisible');

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  final _$loadingAtom = Atom(name: '_LoginStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setEmail(String _email) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(_email);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRememberMe(bool _rememberMe) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setRememberMe');
    try {
      return super.setRememberMe(_rememberMe);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleRemeberMe() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.toggleRemeberMe');
    try {
      return super.toggleRemeberMe();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisible() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.togglePasswordVisible');
    try {
      return super.togglePasswordVisible();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rememberMe: ${rememberMe},
email: ${email},
password: ${password},
passwordVisible: ${passwordVisible},
loading: ${loading},
isPasswordValid: ${isPasswordValid},
loginPressed: ${loginPressed},
isEmailValid: ${isEmailValid},
isFormValid: ${isFormValid},
isVisiblePassword: ${isVisiblePassword},
isRememberMe: ${isRememberMe}
    ''';
  }
}
