import 'package:bots/modules/tasks/controllers/tasks.controller.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/utils/app.colors.dart';
import 'package:flutter/material.dart';
import '../../../../../models/task.model.dart';

class TasksPanelTask extends StatelessWidget {
  const TasksPanelTask({required this.task});

  final TaskModel task;

  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                _buildTaskState(),
                const SizedBox(width: 20.0),
                Flexible(
                  child: Text(
                    task.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ),
          Checkbox(
            activeColor: AppColors.mainAppColor,
            value: _getCheckBoxValue(),
            onChanged: (value) {
              TasksController().onPressCheckbox(value, task);
            },
          )
        ],
      ),
    );
  }

  bool _getCheckBoxValue() {
    final length = TasksStore.to.selectedTasks
        .where((element) => element.id == task.id)
        .length;
    return length > 0;
  }

  Widget _buildTaskState() {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: task.completed == 1
            ? AppColors.completedTaskColor
            : AppColors.notCompletedTaskColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
