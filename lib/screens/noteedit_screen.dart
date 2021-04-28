import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_takingnotes/helper/note_provider.dart';
import 'package:proyecto_takingnotes/models/note.dart';
import 'package:proyecto_takingnotes/screens/noteview_screen.dart';
import 'package:proyecto_takingnotes/utils/constants.dart';

class NoteEditPage extends StatefulWidget {
  static const route = '/note-edit';

  @override
  _NoteEditPageState createState() => _NoteEditPageState();
}

class _NoteEditPageState extends State<NoteEditPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  File _image;
  final picker = ImagePicker();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  bool firstTime = true;
  Note selectedNote;
  int id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (firstTime) {
      id = ModalRoute.of(this.context).settings.arguments;
      if (id != null) {
        selectedNote = Provider.of<NoteProvider>(this.context, listen: false).getNote(id);
        titleController.text = selectedNote?.title;
        contentController.text = selectedNote?.content;
        if (selectedNote?.imagePath != null) {
          _image = File(selectedNote.imagePath);
        }
      }
      firstTime = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        
        title: Text(
          "Note Edit",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 30,
          ),
        ),
        elevation: 0.7,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_camera),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              getImage(ImageSource.camera);
            },
          ),
          IconButton(
            icon: Icon(Icons.insert_photo),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              getImage(ImageSource.gallery);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                textAlign: TextAlign.center,
                controller: titleController,
                style: Theme.of(context).textTheme.overline.copyWith(
                      fontSize: 12,
                      color: Theme.of(context).accentColor,

                    ),
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Ingresa el titulo',
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.overline.copyWith(
                        color: Theme.of(context).accentColor,
                        fontSize: 12,
                      ),
                ),
              ),
            ),
            if (_image != null)
              Container(
                padding: EdgeInsets.all(15),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(_image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            size: 16,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: contentController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Ingresa el contenido',
                  hintStyle: Theme.of(context).textTheme.overline.copyWith(
                        color: Theme.of(context).accentColor,
                        fontSize: 12,
                      ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) titleController.text = 'Nota sin titulo';
          savenote();
        },
        child: Icon(
          Icons.save,
          color: Theme.of(context).canvasColor,
          size: 35,
        ),
      ),
    );
  }

  getImage(ImageSource imageSource) async {
    // final  picker = ImagePicker(); variabla estanciada
    //Añadiendo las imagenes
    PickedFile imagefile = await picker.getImage(source: imageSource);
    if (imagefile == null) return null;

    File tempfile = File(imagefile.path);
    final appdir = await getApplicationDocumentsDirectory();
    final filename = basename(imagefile.path);

    tempfile = await tempfile.copy('${appdir.path}/$filename');

    setState(() {
      _image = tempfile;
    });
  }

  void savenote() {
    String title = titleController.text.trim();
    String content = contentController.text.trim();
    String imagePath = _image != null ? _image.path : null;
    if (id != null) {
      Provider.of<NoteProvider>(this.context, listen: false)
          .addNoteOrUpdate(id, title, content, imagePath, EditMode.UPDATE);
      Navigator.of(this.context).pop();
    } else {
      int id = DateTime.now().millisecondsSinceEpoch;
      Provider.of<NoteProvider>(this.context, listen: false)
          .addNoteOrUpdate(id, title, content, imagePath, EditMode.ADD);
      Navigator.of(this.context).pushReplacementNamed(NoteViewPage.route, arguments: id);
    }
  }
}
