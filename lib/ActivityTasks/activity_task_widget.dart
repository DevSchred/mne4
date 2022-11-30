import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mne/ActivityTasks/activity_task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/api.dart';

class ActivityTaskWidget extends StatefulWidget {
  @override
  State<ActivityTaskWidget> createState() => _ActivityTaskWidgetState();
}

class _ActivityTaskWidgetState extends State<ActivityTaskWidget> {
  final List<ActivityTask> _activitytask = [];
  var loading = false;

  Future<Null> _fetchActivityTasks() async {
    setState(() {
      loading = true;
    });

    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var saved = localStorage.getString('activity_id');
    var res = await Network().getData('mobile/task-activities/$saved');
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final tdata = data['data'];
      if (tdata.length == 0) {
        Navigator.of(context).pushReplacementNamed('error');
      }
      var activitytasksJson = tdata;

      setState(() {
        for (Map activitytaskJson in activitytasksJson) {
          _activitytask.add(ActivityTask.fromJson(activitytaskJson));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchActivityTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _activitytask.length,
                    itemBuilder: (context, i) {
                      final nDataList = _activitytask[i];
                      return Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Padding(
                              padding: const EdgeInsets.only(
                                top: 32.0,
                                bottom: 22.0,
                                left: 16.0,
                                right: 16.0,
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                          text: 'Activity Title: ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: nDataList.title,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                          text: 'Activity Description: ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: nDataList.description,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                          text: 'Activity Type: ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: nDataList.activity_type,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.black))
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
                                                          98, 145, 95, 57))),
                                          onPressed: () async {
                                            SharedPreferences localStorage =
                                                await SharedPreferences
                                                    .getInstance();
                                            localStorage.setString(
                                                'activitytask_id',
                                                nDataList.id);

                                            // ignore: use_build_context_synchronously
                                            Navigator.pushNamed(
                                                context, 'workspace');
                                          },
                                          child: const Text('Start Activity',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ))
                                  ])));
                    })));
  }
}
