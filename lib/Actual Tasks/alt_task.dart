import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

import '../ActivityTasks/activity_task_widget.dart';

class AltTask extends StatefulWidget {
  const AltTask({Key key}) : super(key: key);

  @override
  State<AltTask> createState() => _AltTaskState();
}

class _AltTaskState extends State<AltTask> {
  String tname;

  String tstat;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<Null> _fetchData() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      tname = localStorage.getString('task_name');

      tstat = localStorage.getString('task_stats');
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            centerTitle: true,
            title: const Text('Tasks Details',
                style: TextStyle(color: Colors.black))),
        body: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: VsScrollbar(
            scrollbarFadeDuration: const Duration(milliseconds: 500),
            scrollbarTimeToFade: const Duration(milliseconds: 800),
            controller: _scrollController,
            showTrackOnHover: true,
            isAlwaysShown: true,
            style: const VsScrollbarStyle(
              hoverThickness: 10,
              radius: Radius.circular(10),
              thickness: 10,
              color: Colors.purple,
            ),
            child: Column(children: [
              Container(height: 10, color: Colors.transparent),
              // for image

              Container(
                width: 330,
                child: Image.asset('assets/images/banner4.png'),
              ),
              //for project name
              Container(
                  padding: const EdgeInsets.only(bottom: 25, top: 15),
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 125),
                      child: Text(tname ?? '',
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
                          text: 'Status: ',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: tstat ?? '',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black))
                    ])),
                  ])),
              // for description title
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: const Text('Description',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16))),
              // for actual desc
              Container(
                  padding: const EdgeInsets.only(left: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Activtites needed to complete the task are below: ',
                    style: TextStyle(color: Colors.grey),
                  )),
              // for task title
              Container(
                  padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  alignment: Alignment.centerLeft,
                  child: const Text('Activities',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16))),
              // for task widget
              Container(height: 620, child: ActivityTaskWidget()),
            ]),
          ),
        ));
  }
}
