import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourlibrary/src/pages/main_page.dart';
import 'package:yourlibrary/src/providers/notes_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<NotesProvider>(create: (_) => NotesProvider()),
    ],
    child: MyApp(),
  ));
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
