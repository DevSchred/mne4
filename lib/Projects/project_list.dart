import 'package:flutter/material.dart';
import 'package:mne/Design/custom_shape.dart';
import 'package:mne/Projects/project_widget.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key? key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 246, 219),
        body: Column(children: [
          Container(
            height: 50,
            color: Colors.transparent,
          ),
          Card(
              child: Container(
            height: 100,
            width: 360,
            child: Row(children: [
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: const Text(' My Projects',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)))
            ]),
          )),
          Container(
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
                height: 500,
                child: const ProjectWidget(),
              ),
            ]),
          )
        ]));

    // return Container(
    //   decoration: BoxDecoration(
    //       image: DecorationImage(
    //           image: Image.asset('assets/images/projects.png').image,
    //           fit: BoxFit.fitWidth)),
    //   child: Scaffold(
    //       resizeToAvoidBottomInset: false,
    //       backgroundColor: Colors.transparent,
    //       body: Column(children: [
    //         Container(
    //           height: 210,
    //           color: Colors.transparent,
    //         ),
    //         Container(
    //           height: 534,
    //           child: const ProjectWidget(),
    //         )
    //       ])),
    // );
  }
}
 // Container(
                //   padding: const EdgeInsets.only(top: 8),
                //   height: 300,
                //   width: double.infinity,
                //   color: const Color.fromRGBO(48, 122, 44, 48),
                //   child: Column(children: [
                //     Container(
                //         padding: const EdgeInsets.only(bottom: 25),
                //         child: Image.asset('assets/images/projects.png')),
                //     // Option1
                //     // child: const Text('Projects',
                //     //     style: TextStyle(
                //     //       fontSize: 38,
                //     //       fontWeight: FontWeight.bold,
                //     //       color: Colors.white,
                //     //     )
                //     //     ),
                //   ]),
                // ),