import 'package:bots/utils/app.colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class ChartsService {
  static PieChartData getPieChartDataByTasks(
    int completedTasks,
    int notCompletedTasks,
  ) {
    List<PieChartSectionData> sections = [
      PieChartSectionData(
        radius: Get.width * 0.1,
        color: AppColors.completedTaskColor,
        value: completedTasks.toDouble(),
      ),
      PieChartSectionData(
        radius: Get.width * 0.1,
        color: AppColors.uncompletedTaskColor,
        value: notCompletedTasks.toDouble(),
      ),
    ];

    return PieChartData(sections: sections);
  }
}
