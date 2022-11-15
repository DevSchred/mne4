import 'package:flutter/material.dart';
import 'package:mne/Home/calendar_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'carousel_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  logout() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    Navigator.of(context).pushReplacementNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 40,
            color: Colors.transparent,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: 80,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Row(children: [
              Expanded(
                  child: Row(children: [
                // Container(
                //     height: 80,
                //     decoration: const BoxDecoration(
                //       shape: BoxShape.rectangle,
                //       borderRadius: BorderRadius.all(Radius.circular(10)),
                //     ),
                //     child: Image.asset('assets/images/profile2.png')),
                Container(
                    margin: const EdgeInsets.all(8),
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 5),
                          child: const Text('Welcome,',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                              ))),
                      Container(
                          child: const Text('JohnSmith',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold))),
                    ]))
              ])),
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Logout'),
                  ),
                ],
                onSelected: (value) {
                  if (value == 'logout') {
                    logout();
                  }
                },
              ),
            ]),
          ),
          Container(
            height: 18,
            color: Colors.transparent,
          ),
          // SizedBox(
          //   height: 262,
          //   child: Image.asset('assets/images/dashboard.png',
          //       fit: BoxFit.fitWidth),
          // ),
          Container(
              height: 180,
              width: 360,
              child: Card(
                  color: const Color.fromRGBO(104, 144, 43, 1),
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.only(top: 15, left: 10),
                      child: Row(children: [
                        Column(
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.only(bottom: 25, top: 20),
                                child: const Text('Great work so far!',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold))),
                            Container(
                                padding:
                                    const EdgeInsets.only(top: 5, right: 45),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                    Colors.black,
                                  )),
                                  child: const Text('View Project'),
                                  onPressed: () {},
                                ))
                          ],
                        ),
                        // for chart widget
                        Container(
                          padding: const EdgeInsets.only(left: 45, bottom: 15),
                          child: CircularPercentIndicator(
                            circularStrokeCap: CircularStrokeCap.round,
                            radius: 45.0,
                            lineWidth: 8.0,
                            percent: 0.60,
                            center: const Text("60%",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            progressColor: Colors.white,
                          ),
                        )
                      ])))),
          Container(
            height: 50,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(top: 20, left: 25, bottom: 5),
            child: const Text('Ongoing Tasks',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          // for carousel
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: const Carousel(),
          ),
          //for all tasks list
          Column(
            children: [
              Container(
                height: 50,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(top: 20, left: 25, bottom: 10),
                child: const Text('This Week',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Container(
                height: 120,
                child: const Calendar(),
              ),
            ],
          ),
        ])));
  }
}
