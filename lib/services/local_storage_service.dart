// services/local_storage_service.dart
import 'package:hive/hive.dart';
import '../models/task.dart';

class LocalStorageService {
  final Box<Task> _taskBox = Hive.box<Task>('tasks');

  List<Task> getTasks() => _taskBox.values.toList();

  Future<void> addTask(Task task) async => await _taskBox.add(task);

  Future<void> updateTask(int index, Task task) async => await _taskBox.putAt(index, task);

  Future<void> deleteTask(int index) async => await _taskBox.deleteAt(index);
}
