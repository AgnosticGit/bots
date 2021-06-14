import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartsService {
  static PieChartData getPieChartDataByTasks(
    int completedTasks,
    int notCompletedTasks,
  ) {
    List<PieChartSectionData> sections = [
      PieChartSectionData(
        radius: Get.width * 0.1,
        color: Colors.green,
        value: completedTasks.toDouble(),
      ),
      PieChartSectionData(
        radius: Get.width * 0.1,
        color: Colors.red,
        value: notCompletedTasks.toDouble(),
      ),
    ];

    return PieChartData(sections: sections);
  }
}
