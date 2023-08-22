// Import necessary packages and modules
import 'package:flutter/material.dart';
import 'package:todoapp/pages/signup_page.dart'; // Import the signup page
import 'package:hive_flutter/hive_flutter.dart'; // Import Hive package for local storage

void main() async {
  // Initialize Hive for Flutter
  await Hive.initFlutter();

  // Open a box for data storage
  var box = await Hive.openBox('mybox');

  // Run the Flutter app with initialized box
  runApp(MyApp(box: box));
}

// Define the main application widget
class MyApp extends StatelessWidget {
  final Box<dynamic> box; // A Box for storing data

  // Constructor for MyApp with the required 'box' parameter
  MyApp({Key? key, required this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create and return the MaterialApp widget
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable debug banner
      title: 'Flutter Demo', // Set app title.This will not reflect in the display
      color: Colors.amberAccent, // Set app color
      home: SignUpPage(box: box), // Set the initial page as SignUpPage and pass the 'box' parameter
    );
  }
}
