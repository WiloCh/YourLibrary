import 'package:flutter/material.dart';
import 'package:yourlibrary/src/utils/standard_widgets.dart';
import 'package:yourlibrary/src/widgets/content/note_form.dart';
import 'package:yourlibrary/src/widgets/lists/notes_list.dart';

class NotesPage extends StatefulWidget {
  NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Standard.appBar3(context, "Notas"),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: NotesList(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_circle),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NotesForm()),
            );
          }),
    );
  }
}
