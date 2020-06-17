import 'package:portaldocliente/controllers/login_controller.dart';
import 'package:portaldocliente/views/home/home_view.dart';
import 'package:portaldocliente/views/login/login_view.dart';
import 'package:portaldocliente/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'constants/colors_constants.dart';
import 'models/auth_model.dart';

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginView(),
  "/home": (BuildContext context) => HomeView(),
};

void main() {
  runApp(PortalDoCliente());
}

/// blocks rotation; sets orientation to: portrait
void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class PortalDoCliente extends StatefulWidget {
  @override
  _PortalDoClienteState createState() => _PortalDoClienteState();
}

class _PortalDoClienteState extends State<PortalDoCliente> {
  final AuthModel _auth = AuthModel();
  @override
  void initState() {
    _portraitModeOnly();
    try {
      _auth.loadSettings();
    } catch (e) {
      print("Erro ao carregar Configurações: $e");
    }
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>.value(value: _auth),
        ChangeNotifierProvider<LoginController>.value(
          value: LoginController(),
        ),
      ],
      child: MaterialApp(
          title: 'Portal do Cliente',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: kAccentColor,
            backgroundColor: kBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashView(),
          routes: routes),
    );
  }
}
