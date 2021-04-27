import 'package:flutter/material.dart';
import 'package:proyecto_takingnotes/helper/database_helper.dart';
import 'package:proyecto_takingnotes/models/note.dart';
import 'package:proyecto_takingnotes/utils/constants.dart';
class NoteProvider with ChangeNotifier {
  List _items = [];

  List get items {
    return [..._items];
  }


  Note getNote(int id) {
    return _items.firstWhere((note) => note.id == id, orElse: () => null);
  }
    Future deleteNote(int id) {
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
    return DataBaseHelper.delete(id);
  }

  Future getNotes() async {
    final noteList = await DataBaseHelper.getNotesfromDB();

    _items = noteList
        .map(
          (item) => Note(
            item['id'],
            item['title'],
            item['content'],
            item['imagePath'],
          ),
        )
        .toList();
    notifyListeners();
  }

  Future addNoteOrUpdate(
      int id, String title, String content, String imagePath, EditMode editMode) async {
    final note = Note(id, title, content, imagePath);
    if (EditMode.ADD == editMode) {
      _items.insert(0, note);
    } else {
      _items[_items.indexWhere((note) => note.id == id)] = note;
    }
    notifyListeners();

    DataBaseHelper.insert({
      'id'       : note.id,
      'title'    : note.title,
      'content'  : note.content,
      'imagePath': note.imagePath,

    });
  }
}
