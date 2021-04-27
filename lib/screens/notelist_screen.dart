import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/helper/note_provider.dart';
import 'package:proyecto_takingnotes/screens/noteedit_screen.dart';
import 'package:proyecto_takingnotes/utils/constants.dart';
import 'package:proyecto_takingnotes/widgets/note_list.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<NoteProvider>(context, listen: false).getNotes(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              body: Consumer<NoteProvider>(
                child: notesUI(context),
                builder: (context, noteprovider, child) => noteprovider.items.length <= 0
                    ? child
                    : ListView.builder(
                        itemCount: noteprovider.items.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return header();
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
            );
          }
        }
        return Container();
      },
    );
  }

  Widget header() {
    return GestureDetector(
      onTap: _launchurl,
      child: Container(
        decoration: BoxDecoration(
          color: headerColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(205),
            topRight: Radius.circular(205),
          ),
        ),
        height: 150,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(top: 26, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "App Notes - Grego",
                style: headerRideStyle.copyWith(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "NotsGrego",
                  style: headerNotesStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchurl() async {
    const url = 'https://www.Androidride.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'error';
    }
  }

  Widget notesUI(BuildContext context) {
    return ListView(
      children: [
        header(),
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
                style: noNotesStyle,
                children: [
                  TextSpan(text: 'No hay notas disponibles \nClickea'),
                  TextSpan(
                    text: ' +',
                    style: boldPlus,
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
