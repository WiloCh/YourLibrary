import 'package:flutter/material.dart';
import 'package:yourlibrary/src/utils/views.dart';
import 'package:yourlibrary/src/widgets/content/ShowDrawer_widget.dart';
import 'package:yourlibrary/src/widgets/content/addbook_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.titulo}) : super(key: key);
  final String titulo;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    print("Inicio del Estado");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_selectedIndex == 0
            ? widget.titulo
            : menuOptions[_selectedIndex].label),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: contentWidget[_selectedIndex]),
      drawer: Drawer(child: ShopDrawer()),
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddbookWidget(),
                    ));
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
              print("Cambio del Estado");
            });
          },
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.label))
              .toList()),
    );
  }
}
