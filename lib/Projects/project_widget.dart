import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mne/Network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'project_model.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({Key key}) : super(key: key);

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final List<Project> _projects = [];
  var loading = false;

  Future<Null> _fetchProjects() async {
    setState(() {
      loading = true;
    });
    var res = await Network().getData('mobile/projects');

    // var projects = <Project>[];

    // if (res.statusCode == 200) {
    //   var body = json.decode(res.body);
    //   var tdata = body['data'];
    //   var projectsJson = tdata;

    //   for (var projectJson in projectsJson) {
    //     projects.add(Project.fromJson(projectJson));
    //   }
    // }

    // var body = jsonDecode(res.body);
    // var t = body['data'];

    // var test = t;
    // // (t as List).map((data) => Project.fromJson(data)).toList();
    // return test;

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final tdata = data['data'];
      var projectsJson = tdata;
      // var projectId = projectsJson[0]['id'];
      // debugPrint(projectId);
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('id', json.encode(projectId));

      setState(() {
        for (Map projectJson in projectsJson) {
          _projects.add(Project.fromJson(projectJson));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: 360,
            color: Colors.white,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _projects.length,
                    itemBuilder: (context, i) {
                      final nDataList = _projects[i];
                      return Card(
                          elevation: 2,
                          color: const Color.fromRGBO(247, 251, 241, 1),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 22.0,
                                left: 16.0,
                                right: 16.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 100,
                                    child: Image.asset('assets/images/2.png'),
                                  ),
                                  // Container(
                                  //     width: 100,
                                  //     child: Image.asset(
                                  //         'assets/images/projectlogo2.png')),
                                  // project details
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Container(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Text(nDataList.title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black))),
                                        // for due date
                                        Container(
                                            child: Row(children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  right: 10, top: 8),
                                              child: const Icon(Icons
                                                  .calendar_month_outlined)),
                                          RichText(
                                              text: TextSpan(children: [
                                            const TextSpan(
                                                text: 'Due: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: nDataList.endDate,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black))
                                          ])),
                                        ])),
                                        Container(
                                            child: IconButton(
                                          icon: const Icon(
                                              Icons.more_horiz_outlined),
                                          // style: ButtonStyle(
                                          //     backgroundColor:
                                          //         MaterialStateProperty.all<
                                          //             Color>(const Color
                                          //                 .fromRGBO(
                                          //             104, 144, 43, 1))),
                                          onPressed: () async {
                                            SharedPreferences localStorage =
                                                await SharedPreferences
                                                    .getInstance();
                                            localStorage.setString(
                                                'project_id', nDataList.id);
                                            localStorage.setString(
                                                'project_name',
                                                nDataList.title);
                                            localStorage.setString(
                                                'project_desc',
                                                nDataList.description);
                                            localStorage.setString(
                                                'project_due',
                                                nDataList.endDate);
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushNamed(
                                                context, 'activities');
                                          },
                                        )),
                                      ]),
                                ]),
                          ));
                    },
                  )));
  }
}

// class Display {
//   display() async {
//     var res = await Network().getData('users/project');
//     final data = jsonDecode(res.body);
//     final tdata = data['data'];
//     var projectsJson = tdata;
//   }

  // save() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   // ignore: unused_local_variable
  //   var saved = localStorage.getString('id');

  // }

