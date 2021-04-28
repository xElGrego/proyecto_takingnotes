import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/helper/note_provider.dart';
import 'package:proyecto_takingnotes/screens/noteedit_screen.dart';
import 'package:proyecto_takingnotes/screens/notelist_screen.dart';
import 'package:proyecto_takingnotes/screens/noteview_screen.dart';
import 'package:proyecto_takingnotes/utils/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NoteProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ligthTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => NoteListPage(),
          NoteViewPage.route: (context) => NoteViewPage(),
          NoteEditPage.route: (context) => NoteEditPage(),
        },
      ),
    );
  }
}
