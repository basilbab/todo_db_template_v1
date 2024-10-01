import 'package:sqflite/sqflite.dart';
import 'package:todo_db_template/domain/todo/todo_model.dart';

late Database _db;
Future<void> initializeDatabase() async {
  _db = await openDatabase(
    'todoDB',
    version: 1,
    onCreate: (db, version) {
      db.execute(
          'CREATE TABLE todoTable (id INTEGER PRIMARY KEY, name TEXT, status TEXT)');
    },
  );
  print('Database createdddddddddddddddddddddddddddddddddddddddddddd');
}

Future<void> loadDatabase() async {
  final result = await _db.rawQuery('SELECT * FROM todoTable');
  print(result);
}

Future<void> insertDatabase(TodoModel t) async {
  await _db.rawInsert('INSERT INTO todoTable(name,status) VALUES(?,?)',
      [t.todoName, t.todoStatus]);
  loadDatabase();
}
