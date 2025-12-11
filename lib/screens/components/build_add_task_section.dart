import 'package:flutter/material.dart';
import 'package:myapp/providers/task_provider.dart';
import 'package:myapp/services/task_service.dart';

Widget buildAddTaskSection(
  TextEditingController nameController,
  VoidCallback addTask,
) {
  return Container(
    decoration: BoxDecoration(color: Colors.white),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextField(
                maxLength: 32,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Add Task',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: addTask, child: Text("Add Task")),
        ],
      ),
    ),
  );
}
