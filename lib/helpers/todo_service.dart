import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/helpers/models/todo_model.dart';

class TodoDbProvider {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path =
        join(directory.path, "refactory_todo.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      // Create * database + tables for consumtion then
      await db.execute("""
          CREATE TABLE Todos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          uid INTEGER,
          title TEXT,
          start TEXT,
          end TEXT,
          is_complete INTEGER)""");
    });
  }

  Future<int> addTodo(TodoModel data) async {
    //returns number of items inserted as an integer
    final db = await init(); //open database
    return db.insert(
      "Todos", data.toMap(), //toMap() function from MemoModel
      conflictAlgorithm:
          ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<TodoModel>> fetchTodo() async {
    //returns the mk as a list (array)

    final db = await init();
    final maps = await db
        .query("Todos"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) {
      //create a list of mk
      return TodoModel(
        int.parse(jsonEncode(maps[i]['id'])),
        int.parse(jsonEncode(maps[i]['uid'])),
        jsonEncode(maps[i]['title']),
        jsonEncode(maps[i]['start']),
        jsonEncode(maps[i]['end']),
        int.parse(jsonEncode(maps[i]['is_complete'])),
      );
    });
  }

  Future<int> deleteTodo(int id) async {
    //returns number of items deleted
    final db = await init();

    int result = await db.delete("Todos", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateTodo(int id, TodoModel item) async {
    // returns the number of rows updated

    final db = await init();

    int result = await db
        .update("Todos", item.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
