// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

List<Activity> modelActivityFromJson(String str) =>
    List<Activity>.from(json.decode(str).map((x) => Activity.fromJson(x)));

String modelActivityToJson(List<Activity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson)));

class Activity {
  String id;
  String title;
  String status;

  Activity({
    required this.id,
    required this.title,
    required this.status,
  });

  factory Activity.fromJson(Map<dynamic, dynamic> json) => Activity(
        id: json['id'],
        title: json['title'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'status': status,
      };
}
