import 'package:flutter/material.dart';

import '../Network/auth.dart';

class ResetWidget extends StatefulWidget {
  const ResetWidget({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ResetWidgetState createState() => _ResetWidgetState();
}

class _ResetWidgetState extends State<ResetWidget> {
  final _controller = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showScaffold(String message) {
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Ok',
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('login');
          },
        ),
        duration: const Duration(seconds: 5),
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromRGBO(0, 161, 39, 1)));
  }

  reset() async {
    var data = {'email': emailController.text};

    dynamic response = await CallApi().postData(data, 'password/email');

    if (response.statusCode == 200) {
      return _showScaffold(
        'Link sent successfully!',
      );
    } else {
      return _showScaffold('Unsuccessful');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        key: _scaffoldKey,
        child: Column(children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: const Text('Email',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                  height: 60.0,
                  width: 375,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Please enter your email address',
                    ),
                  ))),
          SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(0, 161, 93, 1),
                )),
                onPressed: () {
                  reset();
                },
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ))
        ]));
  }
}
