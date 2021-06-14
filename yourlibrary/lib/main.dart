import 'package:flutter/material.dart';
import 'package:yourlibrary/src/pages/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Library',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MainPage(titulo: "Your Library"),
    );
  }
}
