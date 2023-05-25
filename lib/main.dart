import 'package:codixel_task/screen/user_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codixel Task',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
         primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainApp(),
    );
  }
}
