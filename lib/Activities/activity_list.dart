import 'package:flutter/material.dart';

import '../Design/custom_shape.dart';
import 'activity_widget.dart';

class ActivityList extends StatefulWidget {
  const ActivityList({Key? key}) : super(key: key);
  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: const Color.fromARGB(255, 251, 167, 32),
        extendBodyBehindAppBar: true,
        body: Column(children: [
          Container(
              alignment: Alignment.center,
              child: Stack(clipBehavior: Clip.none, children: [
                ClipPath(
                    clipper: CustomShape(),
                    child: Container(
                        padding: const EdgeInsets.only(bottom: 128),
                        height: 300,
                        child: Image.asset('assets/images/tasks.png',
                            fit: BoxFit.contain))),
                Container(
                  height: 650,
                  width: double.infinity,
                  color: Colors.transparent,
                ),
                Positioned(
                    top: 140,
                    right: 8,
                    height: 660,
                    child: Container(
                      alignment: Alignment.center,
                      width: 360,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(children: [
                        Container(
                          height: 630,
                          child: const ActivityWidget(),
                        ),
                      ]),
                    ))
              ]))
        ]));
  }
}
