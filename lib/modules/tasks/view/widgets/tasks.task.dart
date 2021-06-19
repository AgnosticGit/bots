import 'package:bots/utils/app.colors.dart';
import 'package:flutter/material.dart';
import '../../../../models/task.model.dart';

class TasksTask extends StatelessWidget {
  const TasksTask({required this.task});

  final TaskModel task;

  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
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
          )
        ],
      ),
    );
  }

  Widget _buildTaskState() {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: task.completed!
            ? AppColors.completedTaskColor
            : AppColors.uncompletedTaskColor,
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}
