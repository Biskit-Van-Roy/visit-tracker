import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:visit_tracker/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'VisitTracker',
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
