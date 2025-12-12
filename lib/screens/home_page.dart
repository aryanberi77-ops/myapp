import 'package:flutter/material.dart';
import 'package:myapp/providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myapp/screens/components/build_task_list.dart';
import 'package:myapp/screens/components/build_add_task_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Controller to read the text user types when adding a task
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            // App logo on the left
            Expanded(child: Image.asset('assets/rdplogo.png', height: 80)),
            Text(
              'Daily Planner',
              style: TextStyle(
                fontFamily: 'Caveat',
                fontSize: 32,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      // Basic drawer (empty for now, but can add menu options later)
      drawer: Drawer(),
      body: Column(
        children: [
          // Calendar at the top of the screen
          TableCalendar(
            calendarFormat: CalendarFormat.month,
            focusedDay: DateTime.now(), // Shows current month by default
            firstDay: DateTime(2025), // Minimum selectable date
            lastDay: DateTime(2027), // Maximum selectable date
          ),
          // Task list section — listens for changes in TaskProvider
          Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {
              return buildTaskList(
                taskProvider.tasks, // List of tasks
                taskProvider.removeTask, // Function to delete tasks
                taskProvider.updateTask, // Function to update checkbox
              );
            },
          ),
          // Add new task section
          Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {
              return buildAddTaskSection(nameController, () async {
                // Adds the task using provider
                await taskProvider.addTasks(nameController.text);
                // Clear the text field after adding
                nameController.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}
