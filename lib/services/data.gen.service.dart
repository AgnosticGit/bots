import 'dart:math';

import 'package:bots/models/task.model.dart';

class DataGenService {
  static List<TaskModel> generateTasks() {
    final list = <TaskModel>[];
    for (int i = 0; i < 200; i++) {
      final completed = Random().nextInt(2) > 0;
      final randMonth = Random().nextInt(7);
      final randDay = Random().nextInt(28);

      list.add(TaskModel(
        id: i,
        completed: completed,
        title: "Task $i",
        time: DateTime(2021, randMonth == 0 ? 1 : randMonth, randDay),
      ));
    }
    return list;
  }
}
