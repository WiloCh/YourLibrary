import 'package:flutter/material.dart';
import 'package:yourlibrary/src/models/book_model.dart';
import 'package:yourlibrary/src/services/book_service.dart';
import 'package:yourlibrary/src/widgets/cards/books_card.dart';

class BooksList extends StatefulWidget {
  const BooksList({Key? key}) : super(key: key);

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  final BookService _service = BookService();
  List<Book> _books = [];

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _books.length == 0
        ? Container(
            child: Center(child: Text('Descargando Libros')),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: _books.map((e) => BooksCard(currentBook: e)).toList());
  }

  _loadBooks() {
    _service.getBooks().then((value) {
      _books = value!;
      setState(() {});
    });
  }
}
