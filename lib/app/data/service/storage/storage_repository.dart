import 'package:getx_todo/app/data/models/task_model.dart';
import 'package:getx_todo/app/data/providers/task/task_provider.dart';

class StorageRepository {
  late TaskProvider taskProvider;

  StorageRepository({required this.taskProvider});

  List<TaskModel> readTasks() => taskProvider.readTasks();

  void writeTasks(List<TaskModel> tasks) => taskProvider.writeTasks(tasks);
}
