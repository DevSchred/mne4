import 'package:flutter/material.dart';

import 'reset_widget.dart';

class Reset extends StatefulWidget {
  const Reset({Key key}) : super(key: key);

  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext coontext) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: Image.asset('assets/images/reset.png').image,
                fit: BoxFit.fitWidth)),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                width: 360,
                height: 400,
                color: Colors.transparent,
                padding: const EdgeInsets.all(8),
                child: const ResetWidget(),
              ),
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.transparent,
              ),
            ])));
  }
}
