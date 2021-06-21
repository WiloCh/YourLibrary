import 'package:flutter/material.dart';
import 'package:yourlibrary/src/widgets/lists/books_list.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return SingleChildScrollView(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 20.0,
        ),
        Text("Tus Libros", style: Theme.of(context).textTheme.headline5),
        BooksList()
      ],
    ));
  }
}
