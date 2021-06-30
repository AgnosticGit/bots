import 'package:bots/models/task.model.dart';

class MathService {
  static int countTasks(List<TaskModel> list, int completed) {
    return list.where((task) {
      if (task.completed != null) {
        if (completed == 1) return task.completed == 1;
        return task.completed == 0;
      }
      return false;
    }).length;
  }

  static double percentOf(int count, int unit) {
    return unit / count * 100;
  }
}
