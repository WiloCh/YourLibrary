import 'package:flutter/material.dart';
import 'package:yourlibrary/src/pages/book_page.dart';
import 'package:yourlibrary/src/widgets/content/addbook_widget.dart';
import 'package:yourlibrary/src/widgets/content/home_widget.dart';
import 'package:yourlibrary/src/widgets/content/libraries_widget.dart';

class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu.create(Icons.add, "Agregar"),
  ItemMenu.create(Icons.location_on, "Librerias"),
];

List<Widget> contentWidget = [
  HomeWidget(),
  AddbookWidget(),
  LibrariesWidget(),
];
