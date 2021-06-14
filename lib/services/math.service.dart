import 'package:bots/models/task.model.dart';

class MathService {
  static int countCompletedTasks(List<TaskModel> list) {
    return list.where((task) {
      if (task.completed != null) return task.completed!;
      return false;
    }).length;
  }

  static int countNotCompletedTasks(List<TaskModel> list) {
    return list.where((task) {
      if (task.completed != null) return !task.completed!;
      return false;
    }).length;
  }
}
