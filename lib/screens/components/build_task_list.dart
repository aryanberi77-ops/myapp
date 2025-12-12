import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';

// This widget builds the full list of tasks shown on the screen
Widget buildTaskList(
  List<Task> tasks,
  Function(int) removeTask,
  Function(int, bool) updateTask,
) {
  return ListView.builder(
    shrinkWrap: true, // Makes list fit inside a column
    physics:
        NeverScrollableScrollPhysics(), // Disable scrolling (page handles it)
    itemCount: tasks.length,
    itemBuilder: (context, index) {
      final task = tasks[index];
      final isEven = index % 2 == 0; // For alternating background colors

      return Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // Alternate colors between tasks
          tileColor: isEven ? Colors.black : Colors.white,
          leading: Icon(
            task.completed ? Icons.check_circle : Icons.circle_outlined,
          ),
          // Task name with line-through if completed
          title: Text(
            task.name,
            style: TextStyle(
              decoration: task.completed ? TextDecoration.lineThrough : null,
            ),
          ),
          // Buttons on the right side (check + delete)
          trailing: Row(
            children: [
              Checkbox(
                value: task.completed,
                onChanged: (value) => updateTask(index, value!),
              ),
              // Delete button
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => removeTask(index),
              ),
            ],
          ),
        ),
      );
    },
  );
}
