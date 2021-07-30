import 'package:flutter/material.dart';
//import 'package:yourlibrary/src/models/book_model.dart';

class LibrosSearchDelegate extends SearchDelegate {
  //late Book _book;
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return theme.copyWith();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          this.query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("Buscando");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0), child: Text('Busca tu libro favorito'));
  }
}
