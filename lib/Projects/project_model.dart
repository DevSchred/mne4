import 'dart:convert';

List<Project> modelProjectFromJson(String str) =>
    List<Project>.from(json.decode(str).map((x) => Project.fromJson(x)));

String modelProjectToJson(List<Project> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson)));

class Project {
  Project({
    required this.name,
    required this.title,
    required this.description,
    required this.location,
    required this.endDate,
    required this.id,
  });

  String name;
  String title;
  String description;
  String location;
  String endDate;
  String id;

  factory Project.fromJson(Map<dynamic, dynamic> json) => Project(
      name: json['name'],
      title: json['title'],
      description: json['description'],
      location: json['location'],
      endDate: json['end_date'],
      id: json['id']);

  Map<String, dynamic> toJson() => {
        'name': name,
        'title': title,
        'description': description,
        'location': location,
        'end_date': endDate,
        'id': id,
      };
}
