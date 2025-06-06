import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task.dart';
import '../view_models/task_view_model.dart';
import '../view_models/theme_view_model.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final int tileIndex;
  const TaskDetailScreen({super.key, required this.task, required this.tileIndex});

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    final taskViewModel = Provider.of<TaskViewModel>(context);
    return Scaffold(
      backgroundColor: themeViewModel.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: const Text("Task Details"),
        actions: [
          IconButton(
            icon: Icon(themeViewModel.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: () {
              themeViewModel.toggleTheme();
            },
          ),
        ],
        backgroundColor: themeViewModel.isDarkMode ? Colors.deepOrangeAccent : Colors.tealAccent
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  task.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                /// DESCRIPTION
                Text(
                  task.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),

                const SizedBox(height: 24),

                /// DUE DATE
                Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined),
                    const SizedBox(width: 8),
                    Text("Due: ${task.dueDate.toLocal().toString().split(' ')[0]}"),
                  ],
                ),

                const SizedBox(height: 24),

                /// STATUS
                Row(
                  children: [
                    // Checkbox(
                    //   value: task.isCompleted,
                    //   onChanged: (value) {
                    //     final updatedTask = Task(
                    //       title: task.title,
                    //       description: task.description,
                    //       dueDate: task.dueDate,
                    //       isCompleted: value ?? false,
                    //     );
                    //     taskViewModel.updateTask(tileIndex, updatedTask);
                    //   },
                    // ),
                    Text(
                      "Status: ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      task.isCompleted ? "Completed" : "Pending",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: task.isCompleted ? Colors.green : Colors.orange,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                /// DELETE BUTTON
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.delete),
                    label: const Text("Delete Task"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      taskViewModel.deleteTask(tileIndex);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
