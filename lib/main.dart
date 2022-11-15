// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:mne/Activities/activity_list.dart';
import 'package:mne/ActivityTasks/activity_task_list.dart';
import 'package:mne/Forms/form_widget.dart';
import 'package:mne/Forms/workspace.dart';
import 'package:mne/User/splashscreen.dart';
import 'package:mne/test.dart';

import 'Forms/form_error.dart';
import 'Home/home.dart';
import 'Projects/project_list.dart';
import 'User/dashboard.dart';
import 'User/login.dart';
import 'User/password_reset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Test',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) {
          if (settings.name == 'workspace') {
            return new MaterialPageRoute(
                builder: (context) => const Workspace());
          }
          if (settings.name == 'login') {
            return new MaterialPageRoute(builder: (context) => const Login());
          }
          if (settings.name == 'test') {
            return new MaterialPageRoute(builder: (context) => const Test());
          }
          if (settings.name == 'projects') {
            return new MaterialPageRoute(
                builder: (context) => const ProjectList());
          }
          if (settings.name == 'reset') {
            return new MaterialPageRoute(builder: (context) => const Reset());
          }
          if (settings.name == 'home') {
            return new MaterialPageRoute(builder: (context) => const Home());
          }
          if (settings.name == 'dashboard') {
            return new MaterialPageRoute(
                builder: (context) => const Dashboard());
          }
          if (settings.name == 'activities') {
            return new MaterialPageRoute(
                builder: (context) => const ActivityList());
          }
          if (settings.name == 'activitytasks') {
            return new MaterialPageRoute(
                builder: (context) => const ActivityTaskList());
          }
          if (settings.name == 'error') {
            return new MaterialPageRoute(
                builder: (context) => const FormError());
          }
          return null;
        });
  }
}
