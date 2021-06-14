import 'package:json_annotation/json_annotation.dart';

part 'task.model.g.dart';

@JsonSerializable()
class TaskModel {
  TaskModel({
    required this.userId,
    required this.id,
    this.title,
    this.completed,
  });

  int userId;
  int id;
  String? title;
  bool? completed;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
  Map<String, dynamic> toJson() => _$TaskModelToJson(this);
}
