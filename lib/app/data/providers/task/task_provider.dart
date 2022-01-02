import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_todo/app/core/utils/keys.dart';
import 'package:getx_todo/app/data/models/task_model.dart';
import 'package:getx_todo/app/data/service/storage/storage_service.dart';

class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<TaskModel> readTasks() {
    var tasks = <TaskModel>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((task) => tasks.add(TaskModel.fromJson(task)));
    return tasks;
  }

  void writeTasks(List<TaskModel> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
