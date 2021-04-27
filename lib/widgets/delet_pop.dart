import 'package:flutter/material.dart';
import '../helper/note_provider.dart';
import '../models/note.dart';
import 'package:provider/provider.dart';

class DeletePopUp extends StatelessWidget {
  const DeletePopUp({
    Key key,
    @required this.selectedNote,
  }) : super(key: key);
  final Note selectedNote;
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: Text('Borrar'),
      content: Text('¿Estas seguro de borrarla?'),
      actions: [
        ElevatedButton(
          child: Text('Si'),
          onPressed: () {
            Provider.of<NoteProvider>(context, listen: false).deleteNote(selectedNote.id);
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        ElevatedButton(
          child: Text('No'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
