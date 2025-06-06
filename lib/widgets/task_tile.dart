// widgets/task_tile.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../view_models/task_view_model.dart';
import '../views/task_detail_screen.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final int index;

  const TaskTile({required this.task, required this.index});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context, listen: false);

    return ListTile(
      title: Text(task.title),
      subtitle: Text("Due: ${task.dueDate.toLocal().toString().split(' ')[0]}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: task.isCompleted,
            onChanged: (value) {
              final updatedTask = Task(
                title: task.title,
                description: task.description,
                dueDate: task.dueDate,
                isCompleted: value ?? false,
              );
              taskViewModel.updateTask(index, updatedTask);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete, color: Colors.red),
            onPressed: () => taskViewModel.deleteTask(index),
          ),

        ],

      ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => TaskDetailScreen(task: task, tileIndex: index),
            ),
          );
        });
  }
}
