import 'package:bots/models/task.model.dart';
import 'package:bots/stores/store.dart';
import 'package:get/get.dart';

class TasksStore extends Store {
  static TasksStore get to => Get.put(TasksStore());

  List<TaskModel> tasks = [];

  void setTodos(List<TaskModel> newTasks) {
    tasks = newTasks;
    update();
  }
}
