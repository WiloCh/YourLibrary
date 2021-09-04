import 'package:flutter/material.dart';
import 'package:yourlibrary/src/widgets/lists/books_list.dart';

class SearchBooksWidget extends StatelessWidget {
  const SearchBooksWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                onChanged: null,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          BooksList(),
        ],
      ),
    );
  }
}
