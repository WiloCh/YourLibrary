import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourlibrary/src/models/notes_model.dart';
import 'package:yourlibrary/src/providers/notes_provider.dart';
import 'package:yourlibrary/src/utils/standard_widgets.dart';

class NotesForm extends StatefulWidget {
  NotesForm({Key? key}) : super(key: key);

  @override
  _NotesFormState createState() => _NotesFormState();
}

class _NotesFormState extends State<NotesForm> {
  //Clave para vincular el Formulario (Form)
  final formKey = GlobalKey<FormState>();

  //Un objeto del modelo a enviar
  late Notes _element;
  bool _onSaving = false;

  @override
  void initState() {
    super.initState();
    _element = Notes.create("", "");
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Standard.appBar2(context, "Crear Nota"),
      body: SingleChildScrollView(
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Standard.getBackground(context),
            Container(
              margin: EdgeInsets.symmetric(vertical: 35.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              width: size.width * .80,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Theme.of(context).dividerColor)),
              child: Form(
                key: formKey,
                child: Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 32.0, horizontal: 14.0),
                  child: Column(
                    children: [
                      _inputMatter(),
                      _inputNote(),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [_buttonCancel(), _buttonSave()]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _inputMatter() {
    return TextFormField(
        initialValue: _element.matter,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.matter = value.toString();
        },
        validator: (value) {
          if (value!.length < 1) {
            return "El Asunto debe tener al menos 1 caracteres";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "Nota:"),
        maxLength: 100,
        maxLines: 1);
  }

  _inputNote() {
    return TextFormField(
        initialValue: _element.note,
        onSaved: (value) {
          //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
          _element.note = value.toString();
        },
        validator: (value) {
          if (value!.length < 4) {
            return "Debe ingresar una Nota con al menos 4 caracteres";
          } else {
            return null; //Validación se cumple al retorna null
          }
        },
        decoration: InputDecoration(labelText: "contenido"),
        maxLength: 255,
        maxLines: 4);
  }

  _buttonSave() {
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

  _buttonCancel() {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.close),
        style: Standard.buttonStandardStyle(context));
  }

  _sendForm() {
    if (!formKey.currentState!.validate()) return;
    _onSaving = true;
    setState(() {});

    formKey.currentState!.save();

    final NoteProvider = Provider.of<NotesProvider>(context, listen: false);
    NoteProvider.addElement(_element.matter, _element.note).then((value) {
      _element = value;
      formKey.currentState!.reset();
      _onSaving = false;
      setState(() {});
      Navigator.pop(context);
    });
  }
}
