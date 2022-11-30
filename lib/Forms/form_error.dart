import 'package:flutter/material.dart';

class FormError extends StatelessWidget {
  const FormError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(233, 232, 232, 1),
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.transparent,
          ),
          Container(
            child: Image.asset('assets/images/error.png'),
          ),
          Container(
              padding: const EdgeInsets.only(top: 15),
              width: 250,
              height: 80,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(0, 0, 0, 1),
                )),
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('projects');
                },
                child: const Text(
                  'Go Back',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
