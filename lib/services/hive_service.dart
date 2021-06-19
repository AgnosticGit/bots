import 'package:bots/models/task.model.dart';
import 'package:hive/hive.dart';

class HiveService {
  static Future<List<TaskModel>> getTasks() async {
    final tasksBox = await Hive.openBox('tasks');
    return tasksBox.values.toList().cast<TaskModel>();
  }

  static Future addTask(TaskModel task) async {
    final tasksBox = await Hive.openBox('tasks');
    tasksBox.add(task);
  }

  static Future getIsFirstAppEnter() async {
    final firstEnterBox = await Hive.openBox('firstenter');
    return firstEnterBox.get('firstenter');
  }

    static Future setIsFirstAppEnter(bool value) async {
    final firstEnterBox = await Hive.openBox('firstenter');
    return firstEnterBox.put('firstenter', value);
  }
}
