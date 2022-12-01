import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mne/Network/api.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showScaffold(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Try Again',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('login');
          },
        ),
        backgroundColor: Colors.redAccent));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _showScaffold('Invalid Credentials');
  // }

  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _controller = TextEditingController();

  _login() async {
    var data = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    var res = await Network().authData(data, 'auth/login');

    if (res.statusCode == 200) {
      var body = json.decode(res.body);
      var tdata = body['data'];
      var access = tdata['accessToken'];
      var user = tdata['user'];
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(access));
      localStorage.setString('user', json.encode(user));
      return Navigator.of(context).pushReplacementNamed('dashboard');
    } else {
      return setState(() {
        _showScaffold('Invalid Credentials');
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isObscure = true;
  bool _validate = false;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return GestureDetector(
        onTap: () {
          () => FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
            key: _scaffoldKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text('Email',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: SizedBox(
                        height: 60.0,
                        width: 375,
                        child: TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field cannot be empty';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            errorText:
                                _validate ? 'Field cannot be empty' : null,
                            border: const OutlineInputBorder(),
                            labelText: 'Email Address',
                          ),
                        ))),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  margin: const EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text('Password',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                        height: 60.0,
                        width: 375,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field cannot be empty';
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  FocusScope.of(context).unfocus();
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            errorText:
                                _validate ? 'Field cannot be empty' : null,
                            border: const OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ))),
                Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.only(left: 10, top: 15, bottom: 15),
                    child: TextButton(
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                            color: Color.fromRGBO(0, 161, 93, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('reset');
                      },
                    )),
                if (_isLoading)
                  SizedBox(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(0, 161, 39, 1),
                        )),
                        onPressed: () async {
                          setState(() {
                            _isLoading = false;
                          });
                          await _login();
                          if (!mounted) return;
                          setState(() {
                            _isLoading = true;
                          });
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ))
                else
                  const Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Color.fromRGBO(0, 161, 39, 1))),
              ],
            )));
  }
}
