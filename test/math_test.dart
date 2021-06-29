import 'package:bots/models/task.model.dart';
import 'package:bots/services/math.service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Test completed tasks only one and only completed', () {
    final data = [
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 0)
    ];
    final res = MathService.countTasks(data, true);
    expect(res, 1);
  });

  test('Test completed tasks only one and only uncompleted', () {
    final data = [
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 0)
    ];
    final res = MathService.countTasks(data, false);
    expect(res, 1);
  });

  test('Test completed tasks only one and opposite completed', () {
    final data = [
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 0)
    ];
    final res = MathService.countTasks(data, true);
    expect(res, 0);
  });

  test('Test completed tasks only one and opposite uncompleted', () {
    final data = [
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 0)
    ];
    final res = MathService.countTasks(data, false);
    expect(res, 0);
  });

  test('Test some only completed', () {
    final data = [
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 0),
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 1),
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 2),
    ];
    final res = MathService.countTasks(data, true);
    expect(res, 3);
  });

  test('Test some only uncompleted', () {
    final data = [
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 0),
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 1),
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 2),
    ];
    final res = MathService.countTasks(data, false);
    expect(res, 3);
  });

  test('Test some different', () {
    final data = [
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 0),
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 1),
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 2),
      TaskModel(time: DateTime.now(), title: '', completed: true, id: 3),
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 4),
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 5),
      TaskModel(time: DateTime.now(), title: '', completed: false, id: 6),
    ];
    final resCompleted = MathService.countTasks(data, true);
    final resUncompleted = MathService.countTasks(data, false);
    expect(resCompleted, 3);
    expect(resUncompleted, 4);
  });
}
