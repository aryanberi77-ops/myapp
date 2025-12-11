import 'package:myapp/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

// This provider handles all the task logic for the app
class TaskProvider extends ChangeNotifier {
  final TaskService taskService = TaskService();

  // List that stores all the tasks locally
  List<Task> tasks = [];

  // Load all tasks from the database when the app starts
  Future<void> loadTasks() async {
    tasks = await taskService.fetchTasks();
    notifyListeners();
  }

  // Add the task locally so UI updates right away
  Future<void> addTasks(String name) async {
    if (name.trim().isNotEmpty) {
      // Make sure the name isn't empty
      final id = await taskService.addTask(name.trim());
      tasks.add(Task(id: id, name: name.trim(), completed: false));
      notifyListeners();
    }
  }

  // Update a task's completed state
  Future<void> updateTask(int index, bool completed) async {
    final task = tasks[index];
    await taskService.updateTask(task.id, completed);
    // Note: no notifyListeners here — depends on how UI handles update
  }

  // Delete a task
  Future<void> removeTask(int index) async {
    final task = tasks[index];
    await taskService.deleteTask(task.id);
    notifyListeners();
  }
}
