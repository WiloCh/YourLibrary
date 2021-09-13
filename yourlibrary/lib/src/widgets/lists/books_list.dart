import 'package:flutter/material.dart';
import 'package:yourlibrary/src/models/book_model.dart';
import 'package:yourlibrary/src/models/user_model.dart';
import 'package:yourlibrary/src/services/book_service.dart';
import 'package:yourlibrary/src/utils/user_shared_preferences.dart';
import 'package:yourlibrary/src/widgets/cards/books_card.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  late User user;
  final BookService _service = BookService();
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  //@override
  //void dispose() {
  //super.dispose();
  //}

  @override
  Widget build(BuildContext context) {
    return _books.length == 0
        ? Container(
            child: Center(child: CircularProgressIndicator()),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: _books.map((e) => BooksCard(currentBook: e)).toList());
  }

  _loadBooks() {
    final prefs = new Preferences();
    _service.getBooksByUser(prefs.iduser).then((value) {
      _books = value!;
      setState(() {});
    });
  }
}
