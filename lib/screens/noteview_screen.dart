import 'package:flutter/material.dart';

class NoteViewPage extends StatefulWidget {
  static const route = '/note-view';
  @override
  _NoteViewPageState createState() => _NoteViewPageState();
}

class _NoteViewPageState extends State<NoteViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Note View"),
      ),
      body: ListView(),
    );
  }
}