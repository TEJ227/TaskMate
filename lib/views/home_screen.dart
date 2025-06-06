// views/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/task_view_model.dart';
import '../view_models/theme_view_model.dart';
import '../widgets/task_tile.dart';
import 'add_task_screen.dart';
import 'task_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);
    final themeViewModel = Provider.of<ThemeViewModel>(context);

    return Scaffold(
      backgroundColor: themeViewModel.isDarkMode ? Colors.black : Colors.white,
        appBar: AppBar(
          title: Text('TaskMate'),
          actions: [
            IconButton(
              icon: Icon(themeViewModel.isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
              onPressed: () => themeViewModel.toggleTheme(),
            ),
            PopupMenuButton<FilterOption>(
              onSelected: (FilterOption result) {
                taskViewModel.setFilter(result);
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<FilterOption>>[
                const PopupMenuItem<FilterOption>(
                  value: FilterOption.all,
                  child: Text('All'),
                ),
                const PopupMenuItem<FilterOption>(
                  value: FilterOption.completed,
                  child: Text('Completed'),
                ),
                const PopupMenuItem<FilterOption>(
                  value: FilterOption.pending,
                  child: Text('Pending'),
                ),
              ],
            ),
          ],
          backgroundColor: themeViewModel.isDarkMode ? Colors.deepOrangeAccent : Colors.tealAccent
        ),
        body: FutureBuilder(
          //future: taskViewModel.fetchTasksFromApi(), //Calls API to fetch tasks from server
          future: taskViewModel.loadTasks(), //Loads local tasks from Hive Database
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (taskViewModel.tasks.isEmpty) {
                return Center(child: Text('No tasks found.'
                , style: TextStyle(color: themeViewModel.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20.0,)
                )
                );
              }
              return ListView.builder(
                itemCount: taskViewModel.tasks.length,
                itemBuilder: (context, index) {
                  final task = taskViewModel.tasks[index];
                  return TaskTile(task: task, index: index,);
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),

        floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => AddTaskScreen()),
        ),
          child: Icon(Icons.add),
        ),
    );
  }
}


