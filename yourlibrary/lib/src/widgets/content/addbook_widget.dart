import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yourlibrary/src/models/book_model.dart';
import 'package:yourlibrary/src/services/Genres_service.dart';
import 'package:yourlibrary/src/services/book_service.dart';
import 'package:yourlibrary/src/models/genre_model.dart';
import 'package:yourlibrary/src/utils/standard_widgets.dart';

class AddbookWidget extends StatefulWidget {
  AddbookWidget({Key? key}) : super(key: key);

  @override
  _AddbookWidgetState createState() => _AddbookWidgetState();
}

class _AddbookWidgetState extends State<AddbookWidget> {
  GenresService _serviceGenres = new GenresService();

  List<Genre> _genres = [];

  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  BookService _serviceBook = new BookService();
  Book _book = new Book();
  late File _image;
  bool _imageSelected = false;
  bool _onSaving = false;
  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Standard.appBar(context, "Nuevo Libro"),
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            BackgroundWidget(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 25.0),
              child: Column(children: [
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
                  _showImage(),
                  Container(
                      width: 325.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Tooltip(
                            message: "Tomar Foto",
                            child: ElevatedButton(
                              onPressed: _takeImage,
                              child: Icon(Icons.camera_alt),
                              style: Standard.buttonStandardStyle(context),
                            ),
                          ),
                          Tooltip(
                            message: "Buscar Foto",
                            child: ElevatedButton(
                              onPressed: _pickImage,
                              child: Icon(Icons.image),
                              style: Standard.buttonStandardStyle(context),
                            ),
                          )
                        ],
                      ))
                ]),
                Standard.tittleToForm(context, "Registro de Libro"),
                _form()
              ]),
            )
          ],
        ),
      ),
    );
  }

  _form() {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      width: size.width * .85,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).dividerColor)),
      child: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
          child: Column(
            children: [
              _inputTitle(),
              _inputAuthor(),
              _inputEditorial(),
              _inputGenre(),
              _inputDescription(),
              _inputPagNum(),
              _inputPagRead(),
              _buttons()
            ],
          ),
        ),
      ),
    ));
  }

  _inputTitle() {
    return TextFormField(
        initialValue: _book.title,
        onSaved: (value) {
          _book.title = value;
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un nombre con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Titulo"),
        maxLength: 35);
  }

  _inputAuthor() {
    return TextFormField(
        initialValue: _book.author,
        onSaved: (value) {
          _book.author = value;
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un nombre con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Autor"),
        maxLength: 35);
  }

  _inputEditorial() {
    return TextFormField(
        initialValue: _book.editorial,
        onSaved: (value) {
          _book.editorial = value;
        },
        validator: (value) {
          if (value!.length < 3) {
            return "Debe ingresar un nombre con al menos 3 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Editorial"),
        maxLength: 35);
  }

  _inputGenre() {
    return DropdownButton<String>(
      value: _book.genre,
      icon: const Icon(Icons.expand_more),
      iconSize: 24,
      elevation: 16,
      isExpanded: true,
      underline: Container(
        height: 2,
        color: Theme.of(context).dividerColor,
      ),
      onChanged: (String? newValue) {
        setState(() {
          _book.genre = newValue!;
        });
      },
      items: _genres.map<DropdownMenuItem<String>>((Genre value) {
        return DropdownMenuItem<String>(
          value: value.name,
          child: Text(value.name),
        );
      }).toList(),
    );
  }

  _inputDescription() {
    return TextFormField(
        initialValue: _book.description,
        onSaved: (value) {
          _book.description = value;
        },
        validator: (value) {
          if (value!.length < 10) {
            return "Debe ingresar un nombre con al menos 10 caracteres";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Descripcion"),
        maxLength: 255,
        maxLines: 4);
  }

  _inputPagNum() {
    return TextFormField(
        initialValue: _book.pagNum,
        onSaved: (value) {
          _book.pagNum = value;
        },
        validator: (value) {
          int val = int.parse(value.toString());
          if (value!.length < 2) {
            return "El número de páginas debe ser de al menos 2 digitos.";
          } else if (val < 48) {
            return "El número debe ser mayor a 48 para considerarse un libro";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Número de páginas"),
        maxLength: 4);
  }

  _inputPagRead() {
    return TextFormField(
        initialValue: _book.pagRead,
        onSaved: (value) {
          _book.pagRead = value;
        },
        validator: (value) {
          int val = int.parse(value.toString());
          if (value!.length < 1) {
            return "El campo no puede estar vacio";
          } else if (val < 0) {
            return "No se puede ingresar valores negativos";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(labelText: "Número de páginas leidas"),
        maxLength: 4);
  }

  _buttons() {
    return _onSaving
        ? Container(
            height: 50.0,
            width: 50.0,
            child: Center(child: CircularProgressIndicator()))
        : Tooltip(
            message: "Guardar",
            child: ElevatedButton(
              onPressed: () {
                _sendForm();
              },
              child: Icon(Icons.save),
              style: Standard.buttonStandardStyle(context),
            ),
          );
  }

  _sendForm() async {
    if (!formKey.currentState!.validate()) return;

    //Vincula el valor de las controles del formulario a los atributos del modelo
    formKey.currentState!.save();

    if (_imageSelected) {
      _book.photo = await _serviceBook.uploadImage(_image);
    }

    _onSaving = true;
    setState(() {});

    //Llamamos al servicio para guardar el reporte
    _serviceBook.sendBook(_book).then((value) {
      formKey.currentState!.reset();
      _onSaving = false;
      Navigator.pop(context);
    });
  }

  _showImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Theme.of(context).canvasColor),
      child: ClipOval(
          child: _imageSelected == false
              ? Image.asset("assets/images/LibroIcon.png")
              : Image.file(_image)),
    );
  }

  _takeImage() {
    _selectImage(ImageSource.camera);
  }

  _pickImage() {
    _selectImage(ImageSource.gallery);
  }

  Future _selectImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
    } else {
      print('No ha Seleccionado una Imagen.');
      _imageSelected = false;
    }
    setState(() {});
  }

  _loadGenres() {
    _serviceGenres.getTypes().then((value) {
      _genres = value;
      setState(() {});
    });
  }
}
