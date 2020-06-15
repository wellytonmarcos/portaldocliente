import 'package:criar_projeto/stores/auth_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<AuthStore>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text('Login View'),
          ],
        ),
      ),
    );
  }
}