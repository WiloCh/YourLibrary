import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourlibrary/src/providers/notes_provider.dart';

class NotesList extends StatefulWidget {
  NotesList({Key? key}) : super(key: key);

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    final noteProvider = Provider.of<NotesProvider>(context, listen: false);
    noteProvider.loadElements();

    //Eliminar la nota
    _deleteFormDialog(BuildContext context, noteId, noteMatter) {
      return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  noteProvider.deletElement(noteId);
                  Navigator.pop(context);
                },
                child: Text('Eliminar'),
              ),
            ],
            title: Text('¿Quieres eliminar La Nota? : $noteMatter'),
          );
        },
      );
    }

    //Listar las Notas
    return noteProvider.elements.length == 0
        ? Center(
            child: Container(
                height: 100, width: 100, child: CircularProgressIndicator()),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: noteProvider.elements.length,
            itemBuilder: (_, index) => Card(
              // modificamos la forma de nuestro card
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              // agregamos margen a nuestro Card
              margin: EdgeInsets.all(15),
              elevation: 8.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(noteProvider.elements[index].matter),
                    subtitle: Text(noteProvider.elements[index].note),
                    leading: Icon(Icons.book),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => {
                                _deleteFormDialog(
                                    context,
                                    noteProvider.elements[index].id,
                                    noteProvider.elements[index].matter)
                              },
                          child: Icon(Icons.delete))
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
