import 'dart:convert';

List<FormModel> modelFormModelFromJson(String str) =>
    List<FormModel>.from(json.decode(str).map((x) => FormModel.fromJson(x)));

String modelFormModelToJson(List<FormModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson)));

class FormModel {
  String name;
  String type;

  String id;

  FormModel({required this.name, required this.type, required this.id});

  factory FormModel.fromJson(Map<dynamic, dynamic> json) => FormModel(
        name: json['name'],
        type: json['type'],
        id: json['activity_field_id'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'type': type,
        'activity_field_id': id,
      };
}
