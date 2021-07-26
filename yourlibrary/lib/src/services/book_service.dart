import 'dart:convert';
import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:cloudinary_public/cloudinary_public.dart';
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

  Future<dynamic> sendBook(Book book) async {
    try {
      final Map<String, String> _headers = {"content-type": "application/json"};
      var uri = Uri.https(
          "us-central1-backend-yourlibrary.cloudfunctions.net", "/app/books");
      String bookJson = bookToJson(book);
      final resp = await http.post(uri, headers: _headers, body: bookJson);
      if (resp.body.isEmpty) return null;
      return json.decode(resp.body);
    } on Exception catch (e) {
      print("Exception $e");
      return null;
    }
  }

  Future<String> uploadImage(File image) async {
    final cloudinary =
        CloudinaryPublic('dsj9mvatm', 'ml_default', cache: false);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      return response.secureUrl;
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
      return "";
    }
  }
}
