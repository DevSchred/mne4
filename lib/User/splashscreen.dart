import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: unused_import

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/images/splashscreen.png').image,
              fit: BoxFit.fitHeight)),
    );
  }

  void startTimer() {
    Timer(const Duration(seconds: 5), () {
      navigateUser();
    });
  }

  Future<void> navigateUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    if (token == null) {
      Navigator.of(context).pushReplacementNamed('login');
    } else {
      Navigator.of(context).pushReplacementNamed('dashboard');
    }
  }
}
