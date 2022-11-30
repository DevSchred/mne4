import 'dart:convert';

List<TaskModel> modelTaskModelFromJson(String str) =>
    List<TaskModel>.from(json.decode(str).map((x) => TaskModel.fromJson(x)));

String modelTaskModelToJson(List<TaskModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaskModel {
  TaskModel({this.title, this.description, this.status, this.approved});

  String title;
  String description;
  String status;
  String approved;

  factory TaskModel.fromJson(Map<dynamic, dynamic> json) => TaskModel(
        title: json['title'],
        description: json['description'],
        status: json['status'],
        approved: json['approved'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'status': status,
        'approved': approved,
      };
}
