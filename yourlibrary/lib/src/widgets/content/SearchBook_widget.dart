import 'package:flutter/material.dart';
import 'package:progress_indicator/progress_indicator.dart';
import 'package:yourlibrary/src/models/book_model.dart';
import 'package:yourlibrary/src/pages/book_page.dart';
import 'package:yourlibrary/src/services/book_service.dart';
import 'package:yourlibrary/src/utils/user_shared_preferences.dart';

class SearchBooksWidget extends StatefulWidget {
  const SearchBooksWidget({Key? key}) : super(key: key);

  @override
  _SearchBooksWidgetState createState() => _SearchBooksWidgetState();
}

class _SearchBooksWidgetState extends State<SearchBooksWidget> {
  final BookService _service = BookService();
  late Book libro;
  List<Book> _result = [];
  List<Book> display = [];
  bool isLoading = true;

  @override
  void initState() {
    final prefs = new Preferences();
    _service.getBooksByUser(prefs.iduser).then((value) {
      setState(() {
        isLoading = false;
        _result.addAll(value!);
        display = _result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (!isLoading) {
            return index == 0 ? Search(size) : listBooks(index - 1);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        itemCount: display.length + 1,
      ),
    );
  }

  Search(size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            height: size.height / 14,
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              height: size.height / 14,
              width: size.width / 1.2,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Buscar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (text) {
                  text = text.toLowerCase();
                  setState(() {
                    display = _result.where((libro) {
                      var posTitle = libro.title!.toLowerCase();
                      return posTitle.contains(text);
                    }).toList();
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
        ],
      ),
    );
  }

  listBooks(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookPage(book: display[index]),
            ));
      },
      child: Card(
        child: ListTile(
          title: Text((display[index].title).toString()),
          subtitle: Column(
            children: [
              Container(
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text((display[index].author).toString()))),
              Text(''),
              BarProgress(
                  color: Theme.of(context).accentColor,
                  percentage:
                      ((double.parse(display[index].pagRead.toString())) *
                              100.0) /
                          (double.parse(display[index].pagNum.toString())))
            ],
          ),
          leading: display[index].photo == null
              ? Image.asset('assets/images/LibroIcon.png')
              : Image.network(display[index].photo.toString()),
        ),
      ),
    );
  }
}
