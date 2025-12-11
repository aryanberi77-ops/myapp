import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';
import 'package:myapp/services/task_service.dart';
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
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
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
      drawer: Drawer(),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.month,
            focusedDay: DateTime.now(),
            firstDay: DateTime(2025),
            lastDay: DateTime(2027),
          ),
          Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {
              return buildTaskList(
                taskProvider.tasks,
                taskProvider.removeTask,
                taskProvider.updateTask,
              );
            },
          ),
          Consumer<TaskProvider>(
            builder: (context, taskProvider, child) {
              return buildAddTaskSection(nameController, () async {
                await taskProvider.addTask(nameController.text);
                nameController.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}