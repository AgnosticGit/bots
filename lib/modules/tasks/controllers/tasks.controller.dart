import 'package:bots/models/task.model.dart';
import 'package:bots/services/data.gen.service.dart';
import 'package:bots/services/hive_service.dart';
import 'package:bots/stores/tasks.store.dart';

class TasksController {
  void onReady() async {
    await ifFirstEnter();
    setTasks();
  }

  void setTasks() async {
    final tasks = await HiveService.getTasks();
    TasksStore.to.setTasks(tasks);
  }

  Future ifFirstEnter() async {
    if (await HiveService.getIsFirstAppEnter() == null) {
      final list = DataGenService.generateTasks();
      list.forEach((element) {
        HiveService.addTask(element);
      });
      HiveService.setIsFirstAppEnter(true);
    }
  }

  void onPressAddTask(){
    TasksStore.to.setPageControllerPage(1);
  }

  void onInputNewTask(String title){
    TasksStore.to.setNewTaskTitle(title);
  }

  void onClosePanel(){
    TasksStore.to.setPageControllerDefault();
    TasksStore.to.setNewTaskDefault();
  }

  void onPressBackSlidingPanel(){
    TasksStore.to.setPageControllerPage(0);
  }

  void onPressSave(){
    final lastIndex = TasksStore.to.getTasksLastIndex();
    TasksStore.to.setNewTaskId(lastIndex);
    TasksStore.to.setNewTaskTime(DateTime.now());
    TasksStore.to.setNewTaskToTasks();

    final task = TasksStore.to.newTask;
    HiveService.addTask(task);

    TasksStore.to.setNewTaskDefault();
  }

  void onPressCheckbox(bool? value, TaskModel task){
    if(value!){
      TasksStore.to.setTaskToSelectedTasks(task);
    }else{
      TasksStore.to.removeTaskFromSelectedTasks(task);
    }
  }
}
