import 'package:flutter/material.dart';
import 'package:mne/Actual%20Tasks/activity_widget.dart';
import 'package:mne/UserTasks/task_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class ProjectTask extends StatefulWidget {
  const ProjectTask({Key key}) : super(key: key);

  @override
  State<ProjectTask> createState() => _ProjectTaskState();
}

class _ProjectTaskState extends State<ProjectTask> {
  String pname;
  String pdesc;
  String pdue;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<Null> _fetchData() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      pname = localStorage.getString('project_name');
      pdesc = localStorage.getString('project_desc');
      pdue = localStorage.getString('project_due');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text('Project Details',
              style: TextStyle(color: Colors.black))),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(height: 10, color: Colors.transparent),
          // for image

          Container(
            padding: const EdgeInsets.only(top: 10),
            width: 330,
            height: 150,
            child: Image.asset('assets/images/2.png'),
          ),
          //for project name
          Container(
              padding: const EdgeInsets.only(bottom: 25, top: 15),
              child: Row(children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 145),
                  child: Text(pname ?? '',
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
                Container(
                    padding: const EdgeInsets.only(right: 10, top: 8),
                    child: const Icon(Icons.calendar_month_outlined)),
                RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                      text: 'Due: ',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: pdue ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.black))
                ])),
              ])),
          // for description title
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, bottom: 20),
              child: const Text('Description',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          // for actual desc
          Container(
              padding: const EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              child: Text(
                pdesc ?? '',
                style: const TextStyle(color: Colors.grey),
              )),
          // for task title
          Container(
              padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
              alignment: Alignment.centerLeft,
              child: const Text('Tasks',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
          // for task widget
          Container(height: 620, child: const ActivityWidget()),
        ]),
      ),
    );
  }
}
