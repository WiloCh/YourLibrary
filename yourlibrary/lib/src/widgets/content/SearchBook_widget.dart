import 'package:flutter/material.dart';

class SearchBooksWidget extends StatefulWidget {
  SearchBooksWidget({Key? key}) : super(key: key);

  @override
  _SearchBooksWidgetState createState() => _SearchBooksWidgetState();
}

class _SearchBooksWidgetState extends State<SearchBooksWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Ingrese la Búsqueda',
                border: OutlineInputBorder(),
                filled: true,
                errorStyle: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {},
                //color: Colors.amber,
                child: Text(
                  'Buscar',
                  style: TextStyle(
                    //color: Color.,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
