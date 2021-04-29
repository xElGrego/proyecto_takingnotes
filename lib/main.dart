import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/provider/note_provider.dart';
import 'package:proyecto_takingnotes/provider/theme.dart';
import 'package:proyecto_takingnotes/screens/noteedit_screen.dart';
import 'package:proyecto_takingnotes/screens/notelist_screen.dart';
import 'package:proyecto_takingnotes/screens/noteview_screen.dart';
import 'package:proyecto_takingnotes/utils/theme.dart';

void main() => runApp(
      MultiProvider(
        child: MyApp(),
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeProvider(ligthTheme)),
          ChangeNotifierProvider(create: (context) => NoteProvider()),
        ],
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyMaterialApp();
  }
}

class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ligthTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => NoteListPage(),
        NoteViewPage.route: (context) => NoteViewPage(),
        NoteEditPage.route: (context) => NoteEditPage(),
      },
    );
  }
}
