import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bots/services/charts.service.dart';
import 'package:bots/services/math.service.dart';
import 'package:bots/stores/tasks.store.dart';


class TasksPieChart extends StatelessWidget{
  Widget build(BuildContext context){
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
    return ChartsService.getPieChartDataByTasks(
      completedTasks,
      notCompletedTasks,
    );
  }
}