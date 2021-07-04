import 'package:flutter/material.dart';
import 'package:yourlibrary/src/models/book_model.dart';

class BookPage extends StatefulWidget {
  const BookPage({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Informacion'),
    Tab(text: 'Proceso Lectura'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.book.title.toString(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Editar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Boton para editar')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Eliminar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Boton para eliminar')));
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    child: widget.book.photo == null
                        ? Image.asset("assets/images/bu.png")
                        : Image.network(widget.book.photo.toString(),
                            width: 200)),
                Text(" "),
                Text(" "),
                Text(
                  "Autor: " + widget.book.author.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Editorial: " + widget.book.editorial.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Descripción: " + widget.book.description.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "Páginas Leidas: " +
                      widget.book.pagRead.toString() +
                      "/" +
                      widget.book.pagNum.toString(),
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              Text(
                "Descripción: " + widget.book.description.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                "Páginas Leidas: " +
                    widget.book.pagRead.toString() +
                    "/" +
                    widget.book.pagNum.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
