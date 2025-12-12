// class that handles all our CRUD operations with Firestore
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myapp/models/task_model.dart';

class TaskService {
  // Firebase Firestore instance — this lets us talk to the database
  final FirebaseFirestore db = FirebaseFirestore.instance;
  // Local list to store tasks temporarily (not required but useful if needed later)
  final List<Task> tasks = [];

  //Fetch all the tasks from the database and convert them to a list of Task objects
  Future<List<Task>> fetchTasks() async {
    // Get all tasks ordered by timestamp (oldest → newest)
    final snapshot = await db.collection('tasks').orderBy('timestamp').get();
    // Convert every Firestore doc into a Task model
    return snapshot.docs
        .map((doc) => Task.fromMap(doc.id, doc.data()))
        .toList();
  }

  // Add a new task to Firestore and return the generated document ID
  Future<String> addTask(String name) async {
    // Creating a simple map for the new task
    final newTask = {
      'name': name,
      'completed': false, // new tasks always default to not completed
      'timestamp':
          FieldValue.serverTimestamp(), // server time for proper sorting
    };
    // Add the task to Firestore
    final docRef = await db.collection('tasks').add(newTask);
    // Return the ID so the Provider can use it if needed
    return docRef.id;
  }

  //Future to update competed status (bool) of task
  Future<void> updateTask(String id, bool completed) async {
    await db.collection('tasks').doc(id).update({'completed': completed});
  }

  // Delete a task by its document ID
  Future<void> deleteTask(String id) async {
    await db.collection('tasks').doc(id).delete();
  }
}
