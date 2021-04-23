import 'package:flutter/material.dart';

class NoteEditPage extends StatefulWidget {
  static const route = '/note-edit';

  @override
  _NoteEditPageState createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note Edit"),
      ),
      body: ListView(),
    );
  }
}