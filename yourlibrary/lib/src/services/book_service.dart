import 'dart:convert';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:yourlibrary/src/models/book_model.dart';

class BookService {
  BookService();

  Future<List<Book>?> getBooks() async {
    List<Book> items = [];
    try {
      var uri = Uri.https("us-central1-backend-yourlibrary.cloudfunctions.net",
          "/app/books/1/10");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final libro = new Book.fromJson(item);
        items.add(libro);
      }
      return items;
    } on Exception catch (e) {
      print("Exceotion $e");
      return items;
    }
  }
}
