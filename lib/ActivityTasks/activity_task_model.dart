// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<ActivityTask> modelActivityTaskFromJson(String str) =>
    List<ActivityTask>.from(
        json.decode(str).map((x) => ActivityTask.fromJson(x)));

String modelActivityTaskToJson(List<ActivityTask> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson)));

class ActivityTask {
  String id;
  String title;
  String description;
  String activity_type;

  ActivityTask({
    this.activity_type,
    this.description,
    this.id,
    this.title,
  });

  factory ActivityTask.fromJson(Map<dynamic, dynamic> json) => ActivityTask(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      activity_type: json['activity_type']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'activity_type': activity_type,
      };
}
