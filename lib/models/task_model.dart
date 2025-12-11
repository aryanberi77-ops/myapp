// data model for tasks

class Task {
  final String id; // Unique ID for each task
  final String name;
  final bool completed;

  // Constructor to create a Task object
  Task({required this.id, required this.name, required this.completed});

  // This factory method helps us create a Task from a Map
  factory Task.fromMap(String id, Map<String, dynamic> data) {
    return Task(
      id: id, // Set the task ID
      name: data['name'] ?? '',
      completed:
          data['completed'] ?? false, // Get completed status, default to false
    );
  }
}
