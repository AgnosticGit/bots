import 'dart:math';
import 'package:bots/modules/tasks/controllers/tasks.controller.dart';
import 'package:bots/modules/tasks/view/widgets/tasks.add.task.dart';
import 'package:bots/modules/tasks/view/widgets/tasks.line.chart.dart';
import 'package:bots/modules/tasks/view/widgets/tasks.pie.chart.dart';
import 'package:bots/modules/tasks/view/widgets/tasks.piechart.indicator.dart';
import 'package:bots/modules/tasks/view/widgets/tasks.sliding.panel.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:bots/utils/enums.dart';
import 'package:bots/widgets/circle.button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/tasks.list.dart';

class TasksPage extends StatelessWidget {
  final double slidingPanelHeight = 200.0;

  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TasksLineChart(),
            const SizedBox(height: 30.0),
            _buildPieChart(),
            SizedBox(height: slidingPanelHeight),
          ],
        ),
      ),
    );
  }

  Widget _buildPieChart() {
    final tasks = TasksStore.to.tasks;

    if (tasks.length == 0) return Align(child: Text('No Data'));

    return Container(
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
          Align(
            child: Container(
              height: Get.height * 0.3,
              child: TasksPieChart(),
            ),
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
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  color: AppColors.completedTaskColor,
                ),
                const SizedBox(height: 10.0),
                TasksPiechartIndicator(
                  title: Text(
                    'Not Completed',
                    style: TextStyle(fontWeight: FontWeight.w600),
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

  Widget _buildOpenedPanel() {
    return Column(
      children: [
        Container(
          height: 80.0,
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
          decoration: BoxDecoration(
            color: AppColors.slidingPanelColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Row(
            children: [
              Expanded(child: _buildPanelLeftButton()),
              Expanded(
                child: Transform.rotate(
                  angle: pi * 1.5,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(child: _buildPanelRightButton()),
            ],
          ),
        ),
        Expanded(
          child: PageView(
            onPageChanged: TasksStore.to.setCurrentPage,
            controller: TasksStore.to.pageController,
            children: [
              TasksList(),
              TasksAddTask(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPanelLeftButton() {
    final currentPage = TasksStore.to.currentPage;

    if (currentPage == 0) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: PopupMenuButton<SlidingPanelMenu>(
            onSelected: TasksController().onSelectSlidingMenuItem,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<SlidingPanelMenu>>[
                PopupMenuItem(
                  value: SlidingPanelMenu.completed,
                  child: Row(
                    children: [
                      Icon(Icons.check),
                      const SizedBox(width: 10.0),
                      Text('Completed'),
                    ],
                  ),
                ),
                PopupMenuDivider(
                  height: 2,
                ),
                PopupMenuItem(
                  value: SlidingPanelMenu.notCompleted,
                  child: Row(
                    children: [
                      Icon(Icons.close),
                      const SizedBox(width: 10.0),
                      Text('Uncompleted'),
                    ],
                  ),
                ),
                PopupMenuDivider(
                  height: 2,
                ),
                PopupMenuItem(
                  value: SlidingPanelMenu.remove,
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      const SizedBox(width: 10.0),
                      Text('Remove'),
                    ],
                  ),
                ),
              ];
            },
            child: CircleButton(
              child: Icon(
                Icons.menu,
                size: 30.0,
                color: AppColors.slidingPanelColor,
              ),
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CircleButton(
          onTap: TasksController().onPressBackSlidingPanel,
          child: Icon(
            Icons.arrow_back_rounded,
            color: AppColors.slidingPanelColor,
            size: 30.0,
          ),
        ),
      ),
    );
  }

  Widget _buildPanelRightButton() {
    final currentPage = TasksStore.to.currentPage;

    if (currentPage == 0) {
      return Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: CircleButton(
            onTap: TasksController().onPressAddTask,
            child: Icon(
              Icons.add,
              size: 30.0,
              color: AppColors.slidingPanelColor,
            ),
          ),
        ),
      );
    }

    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: CircleButton(
          onTap: TasksController().onPressSave,
          child: Icon(
            Icons.check,
            size: 30.0,
            color: AppColors.slidingPanelColor,
          ),
        ),
      ),
    );
  }
}
