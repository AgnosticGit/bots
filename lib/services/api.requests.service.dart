// import 'package:bots/models/task.model.dart';
// import 'package:bots/services/rest.api.service.dart';
// import 'package:bots/stores/tasks.store.dart';
// import 'package:bots/utils/api.url.dart';
// import 'package:bots/utils/enums.dart';

// class ApiRequestsService {
//   // static Future<void> getTaskList() async {
//   //   await RestApiService<List<TaskModel>, dynamic>(
//   //     url: ApiUrl.todos,
//   //     requestType: RequestType.get,
//   //     successFromJson: (responseBody) {
//   //       return responseBody
//   //           .map<TaskModel>((todo) => TaskModel.fromJson(todo))
//   //           .toList();
//   //     },
//   //     successToStore: (todos) => TasksStore.to.setTodos(todos),
//   //   ).request();
//   // }

//   // static Future<void> addTask() async {
//   //   await RestApiService(
//   //     url: ApiUrl.addTask,
//   //     requestType: RequestType.post,
//   //     body: {
//   //       "userId": 1,
//   //       "title": "Привет Привет Привет",
//   //       "completed": true
//   //     },
//   //     successFromJson: (responseBody) {
//   //       print(responseBody);
//   //     },
//   //   ).request();
//   // }
// }
