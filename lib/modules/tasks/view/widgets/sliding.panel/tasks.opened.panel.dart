import 'dart:math';
import 'package:bots/modules/tasks/controllers/tasks.controller.dart';
import 'package:bots/modules/tasks/view/widgets/sliding.panel/tasks.add.task.dart';
import 'package:bots/modules/tasks/view/widgets/sliding.panel/tasks.list.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:bots/utils/enums.dart';
import 'package:bots/widgets/circle.button.dart';
import 'package:flutter/material.dart';

class TasksOpenedPanel extends StatelessWidget {
  Widget build(BuildContext context) {
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
          onTap: TasksController().onPressSaveTask,
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
