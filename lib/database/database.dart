import 'Task.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {

  static late Database database;
  static List<Task> myTasks =[];

  static Future<void> initializeDatabase() async {

    String path = await getDatabasesPath();
    path = path + 'taskdatabase.db';

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) {
        print('Create Database !!');
        database
            .execute(
            'CREATE TABLE task_table (id INTEGER PRIMARY KEY,title TEXT, des TEXT, date TEXT, time TEXT, type TEXT)')
            .then((value) {
          print('Table task_table is Created');
        }).catchError((error) {
          print(error.toString());
        });
      },
      onOpen: (database) {

        print('Database is Open');
      },
    );
  }

  static Future<void> insertToDatabase({
    required String title,
    required String des,
    required String date,
    required String time,
    required String type,
  }) async {
    await database.rawInsert(
        'INSERT INTO task_table (title,des,date,time,type) VALUES (?,?,?,?,?)',
        [title, des, date, time,type]).then((value) {
      print('${value} is inserted Successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }

  static Future<List<Map<String,dynamic>>> getAllData() async {
    return await database
        .rawQuery(
      'SELECT * FROM task_table',
    ).then((value) {
      print(value);
      return value;
    }).catchError((error) {
      print(error.toString());
      return [];
    });

  }

  static Future<void> updateDatabase({
    required String title,
    required String des,
    required String date,
    required String time,
    required int id,

    required String type,
  }) async {

    database.rawUpdate(
        'UPDATE task_table SET title = ? , des = ?, date = ?, time = ?, type=? WHERE id = ?',
        [title, des, date, time,Type, id,]).then((value) {
      print('${value} is Updated Successfully');
    }).catchError((error) {
      print(error.toString());
    });
  }

  static Future<void> deleteRowFromDatabase(
      {
        required int id,
      }) async {
    database.rawDelete(
        'DELETE FROM task_table WHERE id = ?',[id]
    ).then((value){
      print('${value} is deleted successfully' );
    }).catchError((error){
      print(error.toString());
    });
  }
  static Future<List<Map<String,dynamic>>> getFinishedData() async {
    return await database
        .rawQuery(
      "SELECT * FROM task_table WHERE type ='finished'",
    ).then((value) {
      print(value);
      return value;
    }).catchError((error) {
      print(error.toString());
      return [];
    });

  }
}