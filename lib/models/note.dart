import 'package:intl/intl.dart';

class Note{
  int _id ;
  String _title;
  String _content;
  String _imagepath;
  
  Note(this._id,this._title,this._content,this._imagepath);


  int get id => _id;
  String get title => _title;
  String get content => _content; 
  String get imagepath => _imagepath;


  String get date{
    final date = DateTime.fromMicrosecondsSinceEpoch(id);
    return DateFormat('EEE h:m a, dd/MM/yyyy').format(date);
  }
}