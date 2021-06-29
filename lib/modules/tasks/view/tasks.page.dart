import 'package:bots/modules/tasks/controllers/tasks.controller.dart';
import 'package:bots/modules/tasks/view/widgets/sliding.panel/tasks.collapsed.dart';
import 'package:bots/modules/tasks/view/widgets/sliding.panel/tasks.opened.panel.dart';
import 'package:bots/modules/tasks/view/widgets/charts/tasks.line.chart.dart';
import 'package:bots/modules/tasks/view/widgets/charts/tasks.pie.chart.dart';
import 'package:bots/modules/tasks/view/widgets/charts/tasks.piechart.indicator.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class TasksPage extends StatelessWidget {
  final double slidingPanelHeight = 200.0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<TasksStore>(
        init: TasksStore(),
        initState: (_) => TasksController().onReady(),
        builder: (_) {
          if (TasksStore.to.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          return SlidingUpPanel(
            onPanelOpened: TasksStore.to.update,
            onPanelClosed: TasksController().onClosePanel,
            margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            collapsed: TasksCollapsed(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            panel: TasksOpenedPanel(),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: kToolbarHeight),
                  TasksLineChart(),
                  const SizedBox(height: 30.0),
                  Align(
                    alignment: Get.width > 1024
                        ? Alignment.centerLeft
                        : Alignment.center,
                    child: _buildPieChart(),
                  ),
                  SizedBox(height: slidingPanelHeight),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPieChart() {
    final tasks = TasksStore.to.tasks;

    if (tasks.length == 0) return Align(child: Text('No Data'));

    return Container(
      constraints: BoxConstraints(maxWidth: 600.0),
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            height: 300,
            child: TasksPieChart(),
          ),
          Positioned(
            right: 0.0,
            bottom: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TasksPiechartIndicator(
                  title: Text(
                    'Completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  ),
                  color: AppColors.completedTaskColor,
                ),
                const SizedBox(height: 5.0),
                TasksPiechartIndicator(
                  title: Text(
                    'Not Completed',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  ),
                  color: AppColors.notCompletedTaskColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
