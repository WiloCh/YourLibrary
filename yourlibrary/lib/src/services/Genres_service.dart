import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:yourlibrary/src/models/genre_model.dart';

class GenresService {
  GenresService();

  Future<List<Genre>> getTypes() async =>
      rootBundle.loadString("assets/data/Genres.json").then((data) {
        List<Genre> items = [];
        List<dynamic> jsonList = json.decode(data);
        for (var item in jsonList) {
          final type = new Genre.fromJson(item);
          items.add(type);
        }
        return items;
      });
}
