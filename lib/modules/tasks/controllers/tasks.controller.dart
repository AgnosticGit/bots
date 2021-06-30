import 'package:bots/models/task.model.dart';
import 'package:bots/services/api.requests.service.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:bots/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksController {
  void onReady() async {
    ApiRequestsService.getTaskList();
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

  void onPressSaveTask() {
    final newTask = TasksStore.to.newTask;

    if (newTask.title!.length != 0) {
      ApiRequestsService.addTask(newTask);
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

  void onPressCheckbox(bool? value, TaskModel task) {
    if (value!) {
      TasksStore.to.setTaskToSelectedTasks(task);
    } else {
      TasksStore.to.removeTaskFromSelectedTasks(task);
    }
  }

  void onSelectSlidingMenuItem(SlidingPanelMenu item) {
    final selectedTasks = TasksStore.to.selectedTasks;
    
    if (item == SlidingPanelMenu.completed) {
      ApiRequestsService.changeTasksCompletedStatus(selectedTasks, 1);
    }
    if (item == SlidingPanelMenu.notCompleted) {
      ApiRequestsService.changeTasksCompletedStatus(selectedTasks, 0);
    }
    if (item == SlidingPanelMenu.remove) {
      ApiRequestsService.deleteTask(selectedTasks);
    }
  }
}
