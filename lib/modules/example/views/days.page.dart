import 'package:bots/modules/example/views/widgets/days.bar.chart.dart';
import 'package:bots/modules/example/views/widgets/days.range.picker.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DaysPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return GetBuilder<TasksStore>(
      builder: (_) {
        if (TasksStore.to.isLoading) {
          return Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 56.0,
            ),
            child: Column(
              children: [
                DaysRangePicker(),
                const SizedBox(height: 30.0),
                Expanded(child: DaysBarChart()),
              ],
            ),
          ),
        );
      },
    );
  }
}
