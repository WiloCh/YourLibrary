import 'package:flutter/widgets.dart';
import 'package:yourlibrary/src/models/notes_model.dart';

import 'db_provider.dart';

class NotesProvider extends ChangeNotifier {
  List<Notes> elements = [];

  Future<Notes> addElement(String matter, String note) async {
    Notes element = Notes(matter: matter, note: note);
    final id = await DBProvider.db.insert(element);
    element.id = id;
    this.elements.add(element);
    notifyListeners();
    return element;
  }

  Future<Notes> updateElement(int id, String matter, String note) async {
    Notes element = Notes(id: id, matter: matter, note: note);
    final Id = await DBProvider.db.updateData(element);
    element.id = Id;
    this.elements.where((element) => element.id == id);
    notifyListeners();
    return element;
  }

  loadElements() async {
    final travelsQuery = await DBProvider.db.list();
    this.elements = [...travelsQuery];
    notifyListeners();
  }
}
