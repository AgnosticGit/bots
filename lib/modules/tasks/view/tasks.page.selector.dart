import 'package:bots/modules/tasks/controllers/tasks.controller.dart';
import 'package:bots/modules/tasks/view/tasks.page.mobile.dart';
import 'package:bots/modules/tasks/view/tasks.page.tablet.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/widgets/layout.selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksPageSelector extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<TasksStore>(
      init: TasksStore(),
      initState: (_) => TasksController().onReady(),
      builder: (_) {
        return TasksPageMobile();
        return LayoutSelector(
          mobileLayout: TasksPageMobile(),
          tabletLayout: TasksPageTablet(),
        );
      },
    );
  }
}
