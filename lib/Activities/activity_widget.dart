import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/api.dart';
import '../Projects/project_widget.dart';
import 'activity_model.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({Key? key}) : super(key: key);

  @override
  ActivityWidgetState createState() => ActivityWidgetState();
}

class ActivityWidgetState extends State<ActivityWidget> {
  final List<Activity> _activities = [];
  var loading = false;

  Future<Null> _fetchActivities() async {
    setState(() {
      loading = true;
    });
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    var saved = localStorage.getString('project_id');
    var res = await Network().getData('mobile/project-tasks/$saved');
    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      final tdata = data['data'];
      if (tdata.length == 0) {
        Navigator.of(context).pushReplacementNamed('error');
      }
      var activitiesJson = tdata;

      setState(() {
        for (Map activityJson in activitiesJson) {
          _activities.add(Activity.fromJson(activityJson));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _activities.length,
                    itemBuilder: (context, i) {
                      final nDataList = _activities[i];
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
                                    Container(
                                        padding:
                                            const EdgeInsets.only(bottom: 5),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          const TextSpan(
                                              text: 'Task Title: ',
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
                                    RichText(
                                        text: TextSpan(children: [
                                      const TextSpan(
                                          text: 'Task Status: ',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: nDataList.status,
                                          style: const TextStyle(
                                              fontSize: 14,
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
                                                            226, 147, 21, 1))),
                                            onPressed: () async {
                                              SharedPreferences localStorage =
                                                  await SharedPreferences
                                                      .getInstance();
                                              localStorage.setString(
                                                  'activity_id', nDataList.id);
                                              // ignore: use_build_context_synchronously
                                              Navigator.pushNamed(
                                                  context, 'activitytasks');
                                            },
                                            child: const Text(
                                              'See Activities',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )))
                                  ])));
                    })));
  }
}
