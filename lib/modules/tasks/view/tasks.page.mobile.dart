import 'package:bots/modules/tasks/view/widgets/tasks.list.dart';
import 'package:bots/services/charts.service.dart';
import 'package:bots/services/math.service.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TasksPageMobile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.05),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: PieChart(
                _buildPieChartData(),
                swapAnimationDuration: Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ),
          ),
          Expanded(child: TasksList()),
        ],
      ),
    );
  }

  PieChartData _buildPieChartData() {
    final tasks = TasksStore.to.tasks;
    final completedTasks = MathService.countCompletedTasks(tasks);
    final notCompletedTasks = MathService.countNotCompletedTasks(tasks);
    return ChartsService.getPieChartDataByTasks(
      completedTasks,
      notCompletedTasks,
    );
  }
}
