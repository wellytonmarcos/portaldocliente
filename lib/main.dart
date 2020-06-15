import 'package:portaldocliente/stores/auth_store.dart';
import 'package:portaldocliente/views/home/home_view.dart';
import 'package:portaldocliente/views/login/login_view.dart';
import 'package:portaldocliente/views/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginView(),
  "/home": (BuildContext context) => HomeView(),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>.value(
          value: AuthStore(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashView(),
          routes: routes),
    );
  }
}
