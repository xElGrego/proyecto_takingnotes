import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/provider/note_provider.dart';
import 'package:proyecto_takingnotes/screens/noteview_screen.dart';

class ListItem extends StatelessWidget {
  final int id;
  final String title;
  final String content;
  final String imagePath;
  final String date;
  ListItem({this.id, this.title, this.content, this.imagePath, this.date});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(date),
      onDismissed: (direccion) {
        Provider.of<NoteProvider>(context, listen: false).deleteNote(id);
      },
      child: Container(
        width: double.infinity,
        height: 135.0,
        margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, NoteViewPage.route, arguments: id);
          },
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Theme.of(context).accentColor,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.overline.copyWith(
                                color: Theme.of(context).accentColor,
                                fontSize: 16,
                              ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          date,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.overline.copyWith(
                                color: Theme.of(context).accentColor,
                                fontSize: 12,
                              ),
                        ),
                        SizedBox(height: 8.0),
                        Expanded(
                          child: Text(
                            content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.overline.copyWith(
                                  color:Theme.of(context).accentColor,
                                  fontSize: 12,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (imagePath != null)
                  Row(
                    children: [
                      SizedBox(
                        width: 12.0,
                      ),
                      Container(
                        width: 80.0,
                        height: 95.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: FileImage(
                              File(imagePath),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
