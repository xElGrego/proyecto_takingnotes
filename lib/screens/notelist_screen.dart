import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/provider/note_provider.dart';
import 'package:proyecto_takingnotes/provider/theme.dart';
import 'package:proyecto_takingnotes/screens/noteedit_screen.dart';
import 'package:proyecto_takingnotes/utils/theme.dart';
import 'package:proyecto_takingnotes/widgets/header.dart';
import 'package:proyecto_takingnotes/widgets/note_list.dart';
import 'package:flutter_icomoon_icons/flutter_icomoon_icons.dart';

class NoteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<NoteProvider>(context, listen: false).getNotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Theme.of(context).canvasColor,
                body: Consumer<NoteProvider>(
                  child: notesUI(context),
                  builder: (context, noteprovider, child) => noteprovider.items.length <= 0
                      ? child
                      : ListView.builder(
                          itemCount: noteprovider.items.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Header();
                            } else {
                              final i = index - 1;
                              final item = noteprovider.items[i];
                              return ListItem(
                                id: item.id,
                                content: item.content,
                                title: item.title,
                                imagePath: item.imagePath,
                                date: item.date,
                              );
                            }
                          },
                        ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    gotoNoteEditScreen(context);
                  },
                  child: Icon(Icons.add),
                ),
              ),
            );
          }
        }
        return Container();
      },
    );
  }

 

  Widget notesUI( BuildContext context ) {
    return ListView(
      children: [
        Header(),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Image.asset(
                "assets/crying-emoji.png",
                fit: BoxFit.cover,
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.overline.copyWith(
                      color: Theme.of(context).accentColor,
                      fontSize: 12,
                    ),
                children: [
                  TextSpan(text: 'No hay notas disponibles \nClickea'),
                  TextSpan(
                    text: ' +',
                    style: Theme.of(context).textTheme.overline.copyWith(
                          color: Theme.of(context).accentColor,
                          fontSize: 12,
                        ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        gotoNoteEditScreen(context);
                      },
                  ),
                  TextSpan(text: " Para agregar nota")
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  void gotoNoteEditScreen(context) {
    Navigator.of(context).pushNamed(NoteEditPage.route);
  }
}
