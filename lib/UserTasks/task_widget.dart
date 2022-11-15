import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';

import '../Network/api.dart';
import 'task_model.dart';

class TaskWidget extends StatefulWidget {
  const TaskWidget({Key? key}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  final List<TaskModel> _tasks = [];
  var loading = false;

  Future<Null> _fetchTasks() async {
    setState(() {
      loading = true;
    });

    var res = await Network().getData('users/activities');
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final tdata = data['data'];
      var tasksJson = tdata;

      setState(() {
        for (Map taskJson in tasksJson) {
          _tasks.add(TaskModel.fromJson(taskJson));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.only(left: 7, right: 7),
            color: Colors.white,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, i) {
                      final nDataList = _tasks[i];
                      return Card(
                          color: const Color.fromRGBO(237, 250, 90, 220),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 32,
                                bottom: 32,
                                left: 16,
                                right: 16,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                        text: 'Task Title: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: nDataList.title,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ])),
                                    // RichText(
                                    //     text: TextSpan(children: [
                                    //   const TextSpan(
                                    //     text: 'Task Description: ',
                                    //     style: TextStyle(
                                    //       fontSize: 16,
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.black,
                                    //     ),
                                    //   ),
                                    //   TextSpan(
                                    //     text: nDataList.description,
                                    //     style: const TextStyle(
                                    //       fontSize: 14,
                                    //       color: Colors.black,
                                    //     ),
                                    //   ),
                                    // ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                        text: 'Task Status: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: nDataList.status,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                        text: 'Task Approved: ',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: nDataList.approved,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ])),
                                  ])));
                    })));
  }
}
