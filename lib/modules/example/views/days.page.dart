import 'package:bots/modules/example/views/widgets/days.bar.chart.dart';
import 'package:flutter/material.dart';

class DaysPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: DaysBarChart(),
      ),
    );
  }
}
