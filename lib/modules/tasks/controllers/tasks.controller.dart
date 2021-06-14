import 'package:bots/services/api.requests.service.dart';

class TasksController {
  void onReady() {
    ApiRequestsService.getTodosList();
  }
}
