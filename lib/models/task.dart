// models/task.dart
import 'package:hive/hive.dart';

part 'task.g.dart'; // This line tells Hive to generate the adapter

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  DateTime dueDate;

  @HiveField(3)
  bool isCompleted;

  Task({
    required this.title,
    required this.description,
    required this.dueDate,
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      description: '',
      dueDate: DateTime.now(),
      isCompleted: json['completed'],
    );
  }

  // Map<String, dynamic> toJson() => {
  //   'title': title,
  //   'description': description,
  //   'dueDate': dueDate.toIso8601String(),
  //   'isCompleted': isCompleted,
  // };
}
