import 'package:flutter/material.dart';
import 'package:mne/Projects/barchart_widget.dart';
import 'package:mne/Projects/project_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProjectList extends StatefulWidget {
  const ProjectList({Key key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      Container(
        height: 50,
        color: Colors.transparent,
      ),

      Container(
        padding: const EdgeInsets.only(bottom: 45, top: 15),
        width: 360,
        child: Row(children: [
          Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text('My projects',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold))),
          Container(
              padding: const EdgeInsets.only(left: 175, bottom: 3),
              child: const Icon(Icons.more_vert)),
        ]),
      ),

      // Container(
      //     height: 180,
      //     width: 360,
      //     child: Card(
      //         color: const Color.fromRGBO(104, 144, 43, 1),
      //         child: Container(
      //             margin: const EdgeInsets.all(10),
      //             padding: const EdgeInsets.only(top: 15, left: 10),
      //             child: Row(children: [
      //               Column(
      //                 children: [
      //                   Container(
      //                       padding: const EdgeInsets.only(bottom: 25, top: 20),
      //                       child: const Text('Tasks due today: ',
      //                           style: TextStyle(
      //                               color: Colors.white,
      //                               fontSize: 22,
      //                               fontWeight: FontWeight.bold))),
      //                   Container(
      //                     child: const Text('3',
      //                         style: TextStyle(
      //                             color: Colors.white,
      //                             fontSize: 32,
      //                             fontWeight: FontWeight.bold)),
      //                   )
      //                 ],
      //               ),
      //               Container(
      //                   padding: const EdgeInsets.only(
      //                     left: 45,
      //                     bottom: 15,
      //                   ),
      //                   child: const Icon(Icons.info_outline,
      //                       color: Colors.white, size: 60)),
      //               // for chart widget
      //             ])))),
      // Container(
      //   padding: const EdgeInsets.only(bottom: 10),
      //   height: 200,
      //   child: const BarChartSample3(),
      // ),
      Container(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Card(
            child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(46, 88, 0, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                height: 90,
                width: 150,
                child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //for the title

                      // for the count
                      Container(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: const Icon(Icons.incomplete_circle_outlined,
                              color: Colors.white, size: 40)),
                      Container(
                          padding: const EdgeInsets.only(right: 6, left: 16),
                          child: const Text('10',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34))),
                      // for the dates
                    ])),
          ),
          Card(
            child: Container(
                height: 90,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(75, 116, 9, 1),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Container(
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      //for the title

                      // for the count
                      Container(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: const Icon(Icons.check_rounded,
                              color: Colors.white, size: 40)),
                      Container(
                          padding: const EdgeInsets.only(right: 6, left: 16),
                          child: const Text('2',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 34))),
                    ]))),
          ),
        ]),
      ),
      Row(children: [
        Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(left: 30, bottom: 20, top: 10),
            child: const Text('In Progress',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
        Container(
            padding: const EdgeInsets.only(left: 130, top: 10, bottom: 20),
            child: const Text('Complete',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
      ]),
      Container(
        width: 365,
        height: 552,
        child: const ProjectWidget(),
      ),
    ])));

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