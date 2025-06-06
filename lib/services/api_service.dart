// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class ApiService {
  Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/?_limit=10'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.take(10).map((json) => Task(
        title: json['title'],
        description: '',
        dueDate: DateTime.now(),
        isCompleted: json['completed'],
      )).toList();
    } else {
      throw Exception('Failed to load tasks');
    }
  }
}
