import 'dart:async';

import 'package:bots/models/task.model.dart';
import 'package:bots/services/data.gen.service.dart';
import 'package:bots/services/hive_service.dart';
import 'package:bots/services/internet.service.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:bots/utils/enums.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksController {
  void onReady() async {
    await ifFirstEnter();
    setTasks();
    connection();
  }

  void setTasks() async {
    final internet = await InternetService().lookUpInternet();

    if (internet) {
      TasksStore.to.setIsLoading(true);
      final tasks = await HiveService.getTasks();
      TasksStore.to.setTasks(tasks);
      TasksStore.to.setIsLoading(false);
    } else {
      Timer.periodic(Duration(seconds: 1), (timer) async {
        final look = await InternetService().lookUpInternet();
        TasksStore.to.setIsLoading(true);
        final tasks = await HiveService.getTasks();

        if (look) {
          TasksStore.to.setTasks(tasks);
          TasksStore.to.setIsLoading(false);
          timer.cancel();
        }
      });
    }
  }

  void connection() {
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      setTasks();
    });
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

  void onPressAddTask() {
    TasksStore.to.setPageControllerPage(1);
  }

  void onInputNewTask(String title) {
    TasksStore.to.setNewTaskTitle(title);
  }

  void onClosePanel() {
    TasksStore.to.setPageControllerDefault();
    TasksStore.to.setNewTaskDefault();
  }

  void onPressBackSlidingPanel() {
    TasksStore.to.setPageControllerPage(0);
  }

  void onPressSave() {
    final newTask = TasksStore.to.newTask;
    if (newTask.title!.length != 0) {
      _saveToTemporaryStore();
      _saveToPersistStore();
      TasksStore.to.setNewTaskDefault();
      TasksStore.to.setNewTaskTextControllerEmptyText();
    } else {
      Get.snackbar(
        'Adding task error',
        'Task text can not be empty',
        colorText: Colors.white,
        messageText: Text(
          'Task text can not be empty',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: AppColors.mainAppColor,
      );
    }
  }

  void _saveToTemporaryStore() {
    final lastIndex = TasksStore.to.getTasksLastIndex();
    TasksStore.to.setNewTaskId(lastIndex + 1);
    TasksStore.to.setNewTaskTime(DateTime.now());
    TasksStore.to.setNewTaskToTasks();
  }

  void _saveToPersistStore() {
    final task = TasksStore.to.newTask;
    HiveService.addTask(task);
  }

  void onPressCheckbox(bool? value, TaskModel task) {
    if (value!) {
      TasksStore.to.setTaskToSelectedTasks(task);
    } else {
      TasksStore.to.removeTaskFromSelectedTasks(task);
    }
  }

  void onSelectSlidingMenuItem(SlidingPanelMenu item) {
    if (item == SlidingPanelMenu.completed) {
      TasksStore.to.setSelectedTasksCompleted(true);
      _rewriteTasksToPersistStore();
    }
    if (item == SlidingPanelMenu.notCompleted) {
      TasksStore.to.setSelectedTasksCompleted(false);
      _rewriteTasksToPersistStore();
    }
    if (item == SlidingPanelMenu.remove) {
      TasksStore.to.removeFromTasksSelectedTasks();
      _rewriteTasksToPersistStore();
    }
  }

  void _rewriteTasksToPersistStore() {
    final tasks = TasksStore.to.tasks;
    HiveService.rewriteTasks(tasks);
  }
}
