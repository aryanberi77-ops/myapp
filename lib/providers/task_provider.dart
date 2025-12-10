import 'package:myapp/services/task_service.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final TaskService taskService = TaskService();

  List<Task> tasks = [];

  Future<void> loadTasks() async {
    tasks = await taskService.fetchTasks();
    notifyListeners();
  }

  Future<void> addTasks(String name) async {
    if (name.trim().isNotEmpty) {
      final id = await taskService.addTask(name.trim());
      tasks.add(Task(id: id, name: name.trim(), completed: false));
      notifyListeners();
    }
  }

  Future<void> updateTask(int index, bool completed) async {
    final task = tasks[index];
    await taskService.updateTask(task.id, completed);
  }

  Future<void> removeTask(int index) async {
    final task = tasks[index];
    await taskService.deleteTask(task.id);
    notifyListeners();
  }
}
