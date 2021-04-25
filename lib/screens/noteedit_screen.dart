import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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



  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          "Note Edit",
          style: TextStyle(
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
            color: black,
            onPressed: () {
              getImage(ImageSource.camera);
            },
          ),
          IconButton(
            icon: Icon(Icons.insert_photo),
            color: black,
            onPressed: () {
              getImage(ImageSource.gallery);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            color: black,
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
                controller: titleController,
                style: createTitle,
                maxLines: null,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: 'Ingresa el titulo',
                  border: InputBorder.none,
                ),
              ),
            ),
            if (_image != null)
              Container(
                padding: EdgeInsets.all(15),
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: FileImage(_image),
                          fit: BoxFit.cover,
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
                decoration: InputDecoration(
                  hintText: 'Ingresa el contenido',
                  hintStyle: createContent,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (titleController.text.isEmpty) {
            titleController.text = 'Nota sin titulo';
            //savenote();
          }
        },
        child: Icon(
          Icons.save,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  getImage(ImageSource camera) {}
}
