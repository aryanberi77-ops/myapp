// class that handles all our CRUD operations with Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/task_model.dart';

class TaskService {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final List<Task> tasks = [];

  //Fetch all the tasks from the database and convert them to a list of Task objects
  Future<List<Task>> fetchTasks() async {
    final snapshot = await db.collection('tasks').orderBy('timestamp').get();
    return snapshot.docs
        .map((doc) => Task.fromMap(doc.id, doc.data()))
        .toList();
  }

  Future<String> addTask(String name) async {
    final newTask = {
      'name': name,
      'completed': false,
      'timestamp': FieldValue.serverTimestamp(),
    };
    final docRef = await db.collection('tasks').add(newTask);
    return docRef.id;
  }

  //Future to update competed status (bool) of task
  Future<void> updateTask(String id, bool completed) async {
    await db.collection('tasks').doc(id).update({'completed': completed});
  }

  Future<void> deleteTask(String id) async {
    await db.collection('tasks').doc(id).delete();
  }
}
