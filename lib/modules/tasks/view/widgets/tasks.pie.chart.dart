import 'package:bots/services/math.service.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TasksPieChart extends StatelessWidget {
  Widget build(BuildContext context) {
    return PieChart(
      _buildPieChartData(),
      swapAnimationDuration: Duration(milliseconds: 150),
      swapAnimationCurve: Curves.linear,
    );
  }

  PieChartData _buildPieChartData() {
    final tasks = TasksStore.to.tasks;
    final completedTasks = MathService.countCompletedTasks(tasks);
    final notCompletedTasks = MathService.countNotCompletedTasks(tasks);
    final completedTitle = MathService.percentOf(
      tasks.length,
      completedTasks,
    ).toStringAsFixed(2);
    final notCompletedTitle = MathService.percentOf(
      tasks.length,
      notCompletedTasks,
    ).toStringAsFixed(2);

    return _getPieChartDataByTasks(
      completedTasks,
      notCompletedTasks,
      completedTitle,
      notCompletedTitle,
    );
  }

  PieChartData _getPieChartDataByTasks(
    int completedTasks,
    int notCompletedTasks,
    String completedTitle,
    String notCompletedTitle,
  ) {
    List<PieChartSectionData> sections = [
      PieChartSectionData(
        title: "$completedTitle% ($completedTasks)",
        radius: Get.width * 0.3,
        color: AppColors.completedTaskColor,
        value: completedTasks.toDouble(),
      ),
      PieChartSectionData(
        title: "$notCompletedTitle% ($notCompletedTasks)",
        radius: Get.width * 0.3,
        color: AppColors.notCompletedTaskColor,
        value: notCompletedTasks.toDouble(),
      ),
    ];

    return PieChartData(sections: sections);
  }
}
