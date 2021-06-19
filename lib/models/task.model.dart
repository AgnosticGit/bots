import 'package:hive/hive.dart';

part 'task.model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  TaskModel({
    this.id,
    this.title = '',
    this.completed = false,
    this.time,
  });

  @HiveField(0)
  int? id = 0;

  @HiveField(1)
  String? title;

  @HiveField(2)
  bool? completed;

  @HiveField(3)
  DateTime? time = DateTime.now();
}
