import 'package:flutter/material.dart';

class SearchBooksWidget extends StatefulWidget {
  SearchBooksWidget({Key? key}) : super(key: key);

  @override
  _SearchBooksWidgetState createState() => _SearchBooksWidgetState();
}

class _SearchBooksWidgetState extends State<SearchBooksWidget> {
  final _formkey = GlobalKey<FormState>();

  var _autoValidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: _formkey,
        autovalidateMode: _autoValidate,
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
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Ingresa el termino de búsqueda';
                }
                return null;
              },
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  final isValid = _formkey.currentState!.validate();
                  if (isValid) {
                  } else {
                    setState(() {
                      _autoValidate = AutovalidateMode.always;
                    });
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Color(0XFFFF8F00),
                  onSurface: Colors.amber.shade50,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                child: Text(
                  'Buscar',
                  style: TextStyle(
                    color: Colors.white,
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
