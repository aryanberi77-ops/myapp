import 'package:flutter/material.dart';

// This widget builds the section where users can add a new task
Widget buildAddTaskSection(
  TextEditingController
  nameController, // Controller to read the input from the text field
  VoidCallback
  addTask, // Function that will be called when the "Add Task" button is pressed
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
    ), // White background for the add task section
    child: Padding(
      padding: const EdgeInsets.all(12.0), // Padding around the content
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: TextField(
                maxLength: 32, // Limit task name to 32 characters
                controller:
                    nameController, // Link the text field to the controller
                decoration: const InputDecoration(
                  labelText: 'Add Task', // Placeholder text for the field
                  border:
                      OutlineInputBorder(), // Adds a border around the text field
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed:
                addTask, // Calls the addTask function when button is pressed
            child: Text("Add Task"),
          ),
        ],
      ),
    ),
  );
}
