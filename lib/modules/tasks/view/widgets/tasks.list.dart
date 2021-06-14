import 'package:bots/stores/tasks.store.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.red),
              ),
            ),
            child: const Text(
              'Tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20.0),
              itemCount: TasksStore.to.tasks.length,
              itemBuilder: (_, index) {
                final task = TasksStore.to.tasks[index];
                return Text(task.title ?? '');
              },
            ),
          )
        ],
      ),
    );
  }
}
