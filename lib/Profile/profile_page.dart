import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(height: 50, color: Colors.transparent),
      //for user details
      Card(
          color: Colors.grey[300],
          child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 10),
              height: 135,
              width: 350,
              child: Row(children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    alignment: Alignment.topLeft,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Image.asset(
                      'assets/images/profile2.png',
                      fit: BoxFit.fitHeight,
                    )),
                Container(
                    padding: const EdgeInsets.only(left: 50, top: 35),
                    child: Column(children: [
                      Container(
                          child: const Text(
                        'User Name',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      )),
                      Container(height: 10, color: Colors.transparent),
                      Container(
                          child: const Text(
                        'User Email',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ))
                    ])),
              ]))),
      // for report details
      Container(
        padding: const EdgeInsets.only(top: 15, left: 20),
        alignment: Alignment.topLeft,
        child: const Text('Reports',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      Card(
          color: Colors.grey[300],
          child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 35),
              height: 220,
              width: 350,
              child: Column(children: [
                Row(children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 184),
                    child: TextButton(
                      child: const Text('View Reports',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 21),
                ]),
                const Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Colors.black,
                ),
                Container(height: 10, color: Colors.transparent),
                Row(children: [
                  Container(
                      padding: const EdgeInsets.only(left: 10, right: 173),
                      child: TextButton(
                        child: const Text('Create Reports',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        onPressed: () {},
                      )),
                  const Icon(Icons.arrow_forward_ios, size: 21),
                ]),
                const Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Colors.black,
                ),
              ]))),
      // for logout button
      Container(
        padding: const EdgeInsets.only(top: 15, left: 20),
        alignment: Alignment.topLeft,
        child: const Text('Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      Card(
          color: Colors.grey[300],
          child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.only(top: 35),
              height: 220,
              width: 350,
              child: Column(children: [
                // for dark mode
                Row(children: [
                  Container(
                    child: const Text('Dark Mode',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ]),

                // for logout
                Container(
                    child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 241, 186, 7),
                  )),
                  child: const Text('Logout',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  onPressed: () async {
                    WidgetsFlutterBinding.ensureInitialized();
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    localStorage.remove('token');
                    Navigator.of(context).pushReplacementNamed('login');
                  },
                )),
              ])))
    ]));
  }
}
