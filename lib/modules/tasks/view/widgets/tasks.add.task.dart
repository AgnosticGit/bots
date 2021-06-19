import 'package:bots/modules/tasks/controllers/tasks.controller.dart';
import 'package:bots/stores/tasks.store.dart';
import 'package:bots/widgets/input.dart';
import 'package:flutter/material.dart';

class TasksAddTask extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'New Task',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Input(
            initialValue: TasksStore.to.newTask.title,
            hintText: 'Task text',
            onChanged: (val)=> TasksController().onInputNewTask(val),
          ),
        ],
      ),
    );
  }
}
