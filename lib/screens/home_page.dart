import 'package:flutter/material.dart';
import 'package:myapp/models/task_model.dart';
import 'package:myapp/services/task_service.dart';
import 'package:myapp/providers/task_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Placeholder(),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: CalendarFormat.month,
            focusedDay: DateTime.now(),
            firstDay: DateTime(2025),
            lastDay: DateTime(2027),
          ),
        ],
      ),
    );
  }
}
