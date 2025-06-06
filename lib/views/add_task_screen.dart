// views/add_task_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../view_models/task_view_model.dart';
import '../view_models/theme_view_model.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  void _submitTask() {
    if (_formKey.currentState!.validate()) {
      final newTask = Task(
        title: _titleController.text,
        description: _descController.text,
        dueDate: _selectedDate,
      );
      Provider.of<TaskViewModel>(context, listen: false).addTask(newTask);
      Navigator.pop(context);
    }
  }

  void _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeViewModel = Provider.of<ThemeViewModel>(context);
    return Scaffold(
      backgroundColor: themeViewModel.isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(title: Text('Add Task'),
          backgroundColor: themeViewModel.isDarkMode ? Colors.deepOrangeAccent : Colors.tealAccent
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a title' : null,
              ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a description' : null,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text("Due Date: ${_selectedDate.toLocal()}".split(' ')[0]),
                  Spacer(),
                  TextButton(
                    onPressed: _pickDate,
                    child: Text('Pick Date'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitTask,
                child: Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
