import 'package:flutter/material.dart';

class LibrariesWidget extends StatefulWidget {
  LibrariesWidget({Key? key}) : super(key: key);

  @override
  _LibrariesWidgetState createState() => _LibrariesWidgetState();
}

class _LibrariesWidgetState extends State<LibrariesWidget> {
  @override
  Widget build(BuildContext context) {
    double _heigth = MediaQuery.of(context).size.height;
    print("Altura: $_heigth");

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(" "),
          Text("Mapa de Librerías y Bibliotecas",
              style: Theme.of(context).textTheme.headline5),
          Text(" "),
          SizedBox(
            height: _heigth * 0.6,
            child: Container(color: Colors.blueAccent),
          ),
        ],
      ),
    );
  }
}
