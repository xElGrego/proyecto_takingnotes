import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static Future database() async {
    //obtiene la ubicación/ruta predeterminada de las bases de datos.
    final databasepath = await getDatabasesPath();
    // Establecer la ruta a la base de datos. Nota: Usando la función `join` del
    // complemento `path` es la mejor práctica para asegurar que la ruta sea correctamente
    // construida para cada plataforma.
    // opendatabase: Abre la base de datos en una ruta de acceso determinada
    // join: Une las piezas de ruta de acceso especificadas en una sola ruta de acceso
    // mediante el [separador] de la plataforma actual.
    return openDatabase(
      join(databasepath, 'notes_database.db'),
      // Cuando la base de datos se crea por primera vez, crea una tabla para almacenar la data
      onCreate: (database, version) {
        return database.execute(
            'CREATE TABLE Notes(id INTERGER PRIMARY KEY,title TEXT, content TEXT, imagepath TEXT )');
      },
      // Establece la versión. Esto ejecuta la función onCreate y proporciona una
      // ruta para realizar actualizacones y defradaciones en la base de datos.
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> getNotesfromDB() async {
    //Se crea una instancia de la base de datos
    final database = await DataBaseHelper.database();
    //Query ejecuta una consulta
    return database.query("notes", orderBy: 'id DESC');
  }
}
