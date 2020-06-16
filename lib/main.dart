import 'package:portaldocliente/stores/auth_store.dart';
import 'package:portaldocliente/stores/login_store.dart';
import 'package:portaldocliente/views/home/home_view.dart';
import 'package:portaldocliente/views/login/login_view.dart';
import 'package:portaldocliente/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
  @override
  void initState() {
    _portraitModeOnly();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>.value(
          value: AuthStore(),
        ),
        Provider<LoginStore>.value(
          value: LoginStore(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashView(),
          routes: routes),
    );
  }
}
