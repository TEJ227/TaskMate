// repositories/task_repository.dart
import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:hive/hive.dart';

import '../models/task.dart';
import '../services/api_service.dart';
import '../services/local_storage_service.dart';

class TaskRepository {
  final ApiService apiService;
  final LocalStorageService localStorageService;

  TaskRepository({required this.apiService, required this.localStorageService});

  Future<List<Task>> fetchTasksFromApi() => apiService.fetchTasks();

  Future<List<Task>> getTasks() async {
    var tasks = getTasksFromLocal();
    if (tasks.isEmpty) {
      debugPrint("fetching tasks from api");
      final apiTasks = await apiService.fetchTasks();
      apiTasks.isEmpty ? debugPrint("api tasks empty") : debugPrint("api tasks not empty");
      for (var task in apiTasks) {
        await addTask(task);
        tasks.add(task);
      }
    }

    return tasks;
  }


  List<Task> getTasksFromLocal() => localStorageService.getTasks();

  Future<void> addTask(Task task) => localStorageService.addTask(task);

  Future<void> updateTask(int index, Task task) => localStorageService.updateTask(index, task);

  Future<void> deleteTask(int index) => localStorageService.deleteTask(index);
}
