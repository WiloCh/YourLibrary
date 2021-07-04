import 'package:flutter/material.dart';
import 'package:yourlibrary/src/widgets/content/home_widget.dart';
import 'package:yourlibrary/src/widgets/content/libraries_widget.dart';
import 'package:yourlibrary/src/widgets/content/readbook_widget.dart';

class ItemMenu {
  String label;
  IconData icon;
  ItemMenu(this.icon, this.label);
  ItemMenu.create(this.icon, this.label);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Inicio"),
  ItemMenu.create(Icons.library_books, "Leidos"),
  ItemMenu.create(Icons.location_on, "Librerias"),
];

List<Widget> contentWidget = [
  HomeWidget(),
  ReadbookWidget(),
  LibrariesWidget(),
];
