import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/api.dart';
import 'activity_model.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({Key key}) : super(key: key);

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
            width: 360,
            color: Colors.white,
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _activities.length,
                    itemBuilder: (context, i) {
                      final nDataList = _activities[i];
                      return Card(
                          elevation: 2,
                          // color: const Color.fromRGBO(247, 251, 241, 1),
                          color: Colors.white,
                          child: Container(
                            padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 22.0,
                                left: 16.0,
                                right: 16.0),
                            child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  // project details
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        Row(children: [
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5),
                                              child: Text(nDataList.title,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                      color: Colors.black))),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  left: 160),
                                              child: IconButton(
                                                icon: const Icon(
                                                    Icons.more_horiz_outlined),
                                                onPressed: () async {
                                                  SharedPreferences
                                                      localStorage =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  localStorage.setString(
                                                      'task_id', nDataList.id);
                                                  localStorage.setString(
                                                      'task_name',
                                                      nDataList.title);

                                                  localStorage.setString(
                                                      'task_stats',
                                                      nDataList.status);
                                                  // ignore: use_build_context_synchronously
                                                  Navigator.pushNamed(
                                                      context, 'activitytasks');
                                                },
                                              )),
                                        ]),
                                        // for due date
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 160),
                                          child: RichText(
                                              text: TextSpan(children: [
                                            const TextSpan(
                                                text: 'Status: ',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black)),
                                            TextSpan(
                                                text: nDataList.status,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black))
                                          ])),
                                        ),
                                      ]),
                                ]),
                          ));
                    })));
  }
}

  // Container(
                                          //     padding: const EdgeInsets.only(
                                          //         right: 10, top: 5),
                                          //     child: const Icon(
                                          //         Icons.mode_standby,
                                          //         size: 18)),