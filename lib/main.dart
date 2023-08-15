import 'package:flutter/material.dart';
import 'package:todoapp/data/signup_page.dart';
import 'package:todoapp/pages/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // Init Hive
  await Hive.initFlutter();

  // Open a box
  var box = await Hive.openBox('mybox');

  runApp(MyApp(box: box));
}

class MyApp extends StatelessWidget {
  final Box<dynamic> box;

  MyApp({Key? key, required this.box}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      color: Colors.amberAccent,
      home: SignUpPage(box:box), // Pass the box parameter to HomePage
    );
  }
}
