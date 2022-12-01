import 'package:flutter/material.dart';
import 'package:mne/Activities/activity_list.dart';
import 'package:mne/ActivityTasks/activity_task_list.dart';
import 'package:mne/ActivityTasks/activity_task_widget.dart';
import 'package:mne/Forms/form_error.dart';
import 'package:mne/Forms/form_widget.dart';
import 'package:mne/Forms/workspace.dart';

import 'package:mne/User/login.dart';

import '../Home/home.dart';
import '../Profile/profile_page.dart';
import '../Projects/project_list.dart';
import '../User/dashboard.dart';
import '../User/password_reset.dart';
import '../test.dart';

const String workspace = 'workspace';
const String login = 'login';
const String test = 'test';
const String projects = 'projects';
const String reset = 'reset';
const String home = 'home';
const String dashboard = 'dashboard';
const String activities = 'activities';
const String activitytasks = 'activitytasks';
const String profile = 'profile';
const String error = 'error';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case workspace:
      return MaterialPageRoute(builder: (context) => const Workspace());
    case login:
      return MaterialPageRoute(builder: (context) => const Login());
    case test:
      return MaterialPageRoute(builder: (context) => const Test());
    case projects:
      return MaterialPageRoute(builder: (context) => const ProjectList());
    case reset:
      return MaterialPageRoute(builder: (context) => const Reset());
    case home:
      return MaterialPageRoute(builder: (context) => const Home());
    case dashboard:
      return MaterialPageRoute(builder: (context) => const Dashboard());
    case activities:
      return MaterialPageRoute(builder: (context) => const ActivityList());
    case activitytasks:
      return MaterialPageRoute(builder: (context) => const ActivityTaskList());
    case profile:
      return MaterialPageRoute(builder: (context) => const Profile());
    case error:
      return MaterialPageRoute(builder: (context) => const FormError());
    default:
      throw ('this route name does not exist');
  }
}
