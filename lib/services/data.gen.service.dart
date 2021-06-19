import 'package:bots/models/task.model.dart';

class DataGenService {
  static List<TaskModel> generateTasks() {
    return [
      TaskModel(
        id: 0,
        completed: false,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 1),
      ),
      TaskModel(
        id: 1,
        completed: true,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 2),
      ),
      TaskModel(
        id: 2,
        completed: true,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 1),
      ),
      TaskModel(
        id: 3,
        completed: true,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 2),
      ),
      TaskModel(
        id: 4,
        completed: true,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 1),
      ),
      TaskModel(
        id: 5,
        completed: true,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 2),
      ),
      TaskModel(
        id: 6,
        completed: true,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 1),
      ),
      TaskModel(
        id: 7,
        completed: false,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 2),
      ),
      TaskModel(
        id: 8,
        completed: false,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 2),
      ),
      TaskModel(
        id: 9,
        completed: false,
        title:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        time: DateTime(2021, 1, 1),
      ),
    ];
  }
}
