import 'package:flutter/material.dart';
import 'package:proyecto_takingnotes/helper/database_helper.dart';
import 'package:proyecto_takingnotes/models/note.dart';

class NoteProvider with ChangeNotifier {
  List _items = [];

  List get items {
    return [..._items];
  }

  Future getNotes() async {
    final noteList = await DataBaseHelper.getNotesfromDB();

    _items = noteList
        .map(
          (item) => Note(
            item['id'],
            item['title'],
            item['content'],
            item['imagepath'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
