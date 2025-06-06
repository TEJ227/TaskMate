// view_models/task_view_model.dart
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';
import '../core/locator.dart';

enum FilterOption { all, completed, pending }

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = locator<TaskRepository>();
  List<Task> _tasks = [];
  FilterOption _filter = FilterOption.all;
  bool _isLoading = false;

  List<Task> get tasks {
    switch (_filter) {
      case FilterOption.completed:
        return _tasks.where((task) => task.isCompleted).toList();
      case FilterOption.pending:
        return _tasks.where((task) => !task.isCompleted).toList();
      case FilterOption.all:
        return _tasks;
      default:
        return _tasks;
    }
  }

  FilterOption get filter => _filter;

  bool get isLoading => _isLoading;
  void setFilter(FilterOption filterOption) {
    _filter = filterOption;
    notifyListeners();
  }

/*
  Future<void> loadTasks() async {
    _isLoading = true;
    notifyListeners();
    _tasks = await _repository.getTasks();

    _isLoading = false;
    notifyListeners();
  }
*/

  Future<void> loadTasks() async {
    _tasks = _repository.getTasksFromLocal();
     notifyListeners();
  }

  Future<void> addTask(Task task) async {
    await _repository.addTask(task);
    await loadTasks();
  }

  Future<void> updateTask(int index, Task task) async {
    await _repository.updateTask(index, task);
    await loadTasks();
  }

  Future<void> deleteTask(int index) async {
    await _repository.deleteTask(index);
    await loadTasks();
  }

  Future<void> fetchTasksFromApi() async {
    _isLoading = true;
    try {
      _tasks = await _repository.fetchTasksFromApi();
      // for(var task in _tasks){
      //   await _repository.addTask(task);
      // }
    } catch (e) {
      print("Error fetching tasks: $e");
    }
    _isLoading = false;
  }
}