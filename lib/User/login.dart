import 'package:flutter/material.dart';

import 'login_widget.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/images/login2.png').image,
              fit: BoxFit.fitHeight)),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
              child: Container(
            width: 360,
            height: 400,
            color: Colors.transparent,
            padding: const EdgeInsets.all(8),
            child: const LoginWidget(),
          ))),
    );
  }
}
