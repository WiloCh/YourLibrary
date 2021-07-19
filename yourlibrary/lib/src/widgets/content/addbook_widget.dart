import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yourlibrary/src/services/Genres_service.dart';
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

  late File _image;
  bool _imageSelected = false;
  final _picker = ImagePicker();

  @override
  void initSate() {
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
            Standard.getBackground(context),
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
                Standard.tittleToForm(context, "Registro de Paciente"),
                _form()
              ]),
            )
          ],
        ),
      ),
    );
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
              ? Image.asset("assets/images/LibroIcon.jpg")
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
    final pickedFile = await _picker.getImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      _imageSelected = true;
    } else {
      print('No ha Seleccionado una Imagen.');
      _imageSelected = false;
    }
    setState(() {});
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
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 7.0),
          child: Column(
            children: [
              _inputTitle(),
              _inputAuthor(),
              _inputEditorial(),
              _inputDescription()
            ],
          ),
        ),
      ),
    ));
  }

  _inputTitle() {
    return TextFormField(
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

  _inputDescription() {
    return TextFormField(
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

  _loadGenres() {
    _serviceGenres.getTypes().then((value) {
      _genres = value;
      setState(() {});
    });
  }
}
