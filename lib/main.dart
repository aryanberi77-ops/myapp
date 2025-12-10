import 'package:flutter/material.dart';
import 'package:myapp/firebase_options.dart';
import 'package:myapp/screens/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/task_provider.dart';

void main() async {
  //initialize flutter widget bindings
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize Firebase with default options
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //run the app
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(home: HomePage()),
    );
  }
}