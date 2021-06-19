import 'package:bots/models/task.model.dart';
import 'package:bots/stores/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksStore extends Store {
  static TasksStore get to => Get.put(TasksStore());

  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<TaskModel> tasks = [];
  TaskModel newTask = TaskModel();

  List<TaskModel> selectedTasks = [];

  void setTasks(List<TaskModel> newTasks) {
    tasks = newTasks;
    update();
  }

  void setNewTaskId(int id){
    newTask.id = id;
    update();
  }

  void setNewTaskToTasks(){
    tasks.insert(0, newTask);
    update();
  }

  void setTaskToSelectedTasks(TaskModel task){
    selectedTasks.add(task);
    update();
  }

  void removeTaskFromSelectedTasks(TaskModel task){
    selectedTasks.removeWhere((element) => element.id == task.id);
    update();
  }

  void removeFromTasksSelectedTasks(){
    for(int i = 0; i < tasks.length; i++){
      for(int j = 0; j < selectedTasks.length; j++){
        if(tasks[i].id == selectedTasks[j].id){
          tasks.removeAt(i);
          break;
        }
      }
    }
    update();
  }
  
  void setNewTaskTime(DateTime time){
    newTask.time = time;
    update();
  }

  void setNewTask(TaskModel task){
    newTask = task;
    update();
  }

  void setPageControllerPage(int page) {
    pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 250),
      curve: Curves.linear,
    );
    setCurrentPage(page);
    update();
  }

  void setPageControllerDefault() {
    pageController.jumpToPage(0);
    update();
  }

  void setNewTaskTitle(String newTitle) {
    newTask.title = newTitle;
    update();
  }

  void setNewTaskDefault() {
    newTask = TaskModel();
    update();
  }

  void setCurrentPage(int page) {
    currentPage = page;
    update();
  }

  int getTasksLastIndex() {
    int lastIndex = 0;
    tasks.forEach((task) {
      if (lastIndex < task.id!.toInt()) {
        lastIndex = task.id!.toInt();
      }
    });
    return lastIndex;
  }
}
