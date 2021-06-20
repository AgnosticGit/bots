import 'package:bots/modules/tasks/controllers/tasks.controller.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class TasksSlidingPanel extends StatelessWidget {
  const TasksSlidingPanel({
    required this.child,
    this.panel,
    this.collapsed,
  });

  final Widget child;
  final Widget? panel;
  final Widget? collapsed;

  Widget build(BuildContext context) {
    return SlidingUpPanel(
      onPanelOpened: TasksStore.to.update,
      onPanelClosed: TasksController().onClosePanel,
      margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
      collapsed: collapsed,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
      panel: panel,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
      color: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: child,
      ),
    );
  }
}
