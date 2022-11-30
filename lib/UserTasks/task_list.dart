import 'package:flutter/material.dart';

import 'task_widget.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: Image.asset('assets/images/tasks2.png').image,
              fit: BoxFit.fitWidth)),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(children: [
            Container(
              height: 150,
              color: Colors.transparent,
            ),
            Container(
              height: 580,
              child: const TaskWidget(),
            )
          ])),
    );
  }
}
