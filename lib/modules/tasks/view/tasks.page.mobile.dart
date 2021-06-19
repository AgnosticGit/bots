import 'dart:math';
import 'package:bots/modules/tasks/view/widgets/tasks.pie.chart.dart';
import 'package:bots/modules/tasks/view/widgets/tasks.piechart.indicator.dart';
import 'package:bots/modules/tasks/view/widgets/tasks.sliding.panel.dart';
import 'package:bots/services/math.service.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/tasks.list.dart';

class TasksPageMobile extends StatelessWidget {
  final double slidingPanelHeight = 200.0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.05),
      body: TasksSlidingPanel(
        collapsed: Container(
          decoration: BoxDecoration(
            color: AppColors.slidingPanelColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Transform.rotate(
                angle: pi / 2,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              const Text(
                'Your Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        panel: _buildOpenedPanel(),
        child: _buildPieChart(),
      ),
    );
  }

  Widget _buildPieChart() {
    final tasks = TasksStore.to.tasks;

    if (tasks.length == 0) return Align(child: Text('No Data'));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Stack(
        children: [
          TasksPiechartIndicator(
            title: Text('Completed'),
            color: AppColors.completedTaskColor,
          ),
          Positioned(
            top: 30.0,
            child: TasksPiechartIndicator(
              title: Text('Not Completed'),
              color: AppColors.notCompletedTaskColor,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: Get.height - slidingPanelHeight,
              child: TasksPieChart(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenedPanel() {
    return Column(
      children: [
        Container(
          height: 80.0,
          padding: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            color: AppColors.slidingPanelColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(child: const SizedBox()),
              Expanded(
                child: Transform.rotate(
                  angle: pi * 1.5,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Add Task',
                        style: TextStyle(
                          color: AppColors.slidingPanelColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: TasksList()),
      ],
    );
  }
}
