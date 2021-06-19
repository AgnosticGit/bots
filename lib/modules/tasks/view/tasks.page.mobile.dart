import 'dart:math';
import 'package:bots/modules/tasks/view/widgets/tasks.sliding.panel.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'widgets/tasks.list.dart';

class TasksPageMobile extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.05),
      body: TasksSlidingPanel(
        collapsed: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                  size: 30.0,
                ),
              ),
              const Text(
                'Your Tasks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        panel: Column(
          children: [
            const SizedBox(height: 10.0),
            Transform.rotate(
              angle: pi * 1.5,
              child: Icon(
                Icons.arrow_back_ios,
                size: 30.0,
              ),
            ),
            Expanded(child: TasksList()),
          ],
        ),
        child: Container(),
      ),
    );
  }
}
