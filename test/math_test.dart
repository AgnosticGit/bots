import 'package:bots/models/task.model.dart';
import 'package:bots/services/math.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test completed tasks only one and only completed', () {
    final data = [
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 0)
    ];
    final res = MathService.countTasks(data, true);
    expect(res, 1);
  });

  test('Test completed tasks only one and only uncompleted', () {
    final data = [
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 0)
    ];
    final res = MathService.countTasks(data, false);
    expect(res, 1);
  });

  test('Test completed tasks only one and opposite completed', () {
    final data = [
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 0)
    ];
    final res = MathService.countTasks(data, true);
    expect(res, 0);
  });

  test('Test completed tasks only one and opposite uncompleted', () {
    final data = [
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 0)
    ];
    final res = MathService.countTasks(data, false);
    expect(res, 0);
  });

  test('Test some only completed', () {
    final data = [
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 0),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 1),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 2),
    ];
    final res = MathService.countTasks(data, true);
    expect(res, 3);
  });

  test('Test some only uncompleted', () {
    final data = [
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 0),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 1),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 2),
    ];
    final res = MathService.countTasks(data, false);
    expect(res, 3);
  });

  test('Test some different', () {
    final data = [
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 0),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 1),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 2),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 1, id: 3),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 4),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 5),
      TaskModel(createdAt: DateTime.now(), title: '', completed: 0, id: 6),
    ];
    final resCompleted = MathService.countTasks(data, true);
    final resUncompleted = MathService.countTasks(data, false);
    expect(resCompleted, 3);
    expect(resUncompleted, 4);
  });
}
