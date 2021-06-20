import 'package:bots/models/task.model.dart';
import 'package:bots/stores/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TasksStore extends Store {
  static TasksStore get to => Get.put(TasksStore());

  PageController pageController = PageController(initialPage: 0);
  final newTaskTextController = TextEditingController();

  int currentPage = 0;

  List<TaskModel> tasks = [];
  TaskModel newTask = TaskModel();

  bool isLoading = false;
  bool isReconnecting = false;

  List<TaskModel> selectedTasks = [];
  DateRangePickerSelectionChangedArgs? selectedDates =
      DateRangePickerSelectionChangedArgs(
    PickerDateRange(
      DateTime(2021, 1, 1),
      DateTime.now(),
    ),
  );

  void setIsLoading(bool state){
    isLoading = state;
    update();
  }

  void setIsReconnecting(bool state){
    isReconnecting = state;
    update();
  }

  void setTasks(List<TaskModel> newTasks) {
    tasks = newTasks;
    update();
  }

  void setSelectedDate(DateRangePickerSelectionChangedArgs dateTime) {
    selectedDates = dateTime;
    update();
  }

  void setNewTaskId(int id) {
    newTask.id = id;
    update();
  }

  void setSelectedDateDefault() {
    selectedDates = null;
    update();
  }

  void setNewTaskTextControllerEmptyText() {
    newTaskTextController.clear();
    update();
  }

  void setNewTaskToTasks() {
    tasks.insert(0, newTask);
    update();
  }

  void setTaskToSelectedTasks(TaskModel task) {
    selectedTasks.add(task);
    update();
  }

  void setSelectedTasksCompleted(bool value) {
    selectedTasks.forEach((selTask) {
      tasks.firstWhere((task) => task.id == selTask.id).completed = value;
    });
    setSelectedTasksDefault();
    update();
  }

  void removeTaskFromSelectedTasks(TaskModel task) {
    selectedTasks.removeWhere((element) => element.id == task.id);
    update();
  }

  void removeFromTasksSelectedTasks() {
    selectedTasks.forEach((selTask) {
      final index = tasks.indexWhere((task) => task.id == selTask.id);
      tasks.removeAt(index);
    });

    setSelectedTasksDefault();
    update();
  }

  void setSelectedTasksDefault() {
    selectedTasks = [];
    update();
  }

  void setNewTaskTime(DateTime time) {
    newTask.time = time;
    update();
  }

  void setNewTask(TaskModel task) {
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
