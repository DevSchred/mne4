import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mne/Network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'project_model.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({Key? key}) : super(key: key);
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
            color: Colors.white,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _projects.length,
                    itemBuilder: (context, i) {
                      final nDataList = _projects[i];
                      return Card(
                          elevation: 2,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 32.0,
                                bottom: 22.0,
                                left: 16.0,
                                right: 16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            const TextSpan(
                                                text: 'Project Name: ',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: nDataList.title,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black))
                                          ]))),
                                  // RichText(
                                  //     text: TextSpan(children: [
                                  //   const TextSpan(
                                  //       text: 'Project Location: ',
                                  //       style: TextStyle(
                                  //           fontSize: 14,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.black)),
                                  //   TextSpan(
                                  //       text: nDataList.location,
                                  //       style: const TextStyle(
                                  //           color: Colors.black))
                                  // ])),
                                  RichText(
                                      text: TextSpan(children: [
                                    const TextSpan(
                                        text: 'Project Description: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black)),
                                    TextSpan(
                                        text: nDataList.description,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black))
                                  ])),
                                  Container(
                                      padding: const EdgeInsets.only(top: 15),
                                      alignment: Alignment.bottomRight,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color.fromRGBO(
                                                          104, 144, 43, 1))),
                                          onPressed: () async {
                                            SharedPreferences localStorage =
                                                await SharedPreferences
                                                    .getInstance();
                                            localStorage.setString(
                                                'project_id', nDataList.id);
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushNamed(
                                                context, 'activities');
                                          },
                                          child: const Text(
                                            'See Tasks',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )))
                                  // RichText(
                                  //     text: TextSpan(children: [
                                  //   const TextSpan(
                                  //       text: 'Project Completion Date: ',
                                  //       style: TextStyle(
                                  //           fontSize: 14,
                                  //           fontWeight: FontWeight.bold,
                                  //           color: Colors.black)),
                                  //   TextSpan(
                                  //       text: nDataList.endDate,
                                  //       style: const TextStyle(
                                  //           color: Colors.black))
                                  // ])),
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

