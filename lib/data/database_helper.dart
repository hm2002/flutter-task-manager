import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import '../models/task_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = p.join(await getDatabasesPath(), 'tasks.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, isCompleted INTEGER)',
        );
      },
    );
  }

  Future<int> insertTask(TaskModel task) async {
    final db = await database;
    return await db.insert('tasks', task.toMap());
  }

  Future<List<TaskModel>> fetchTasks() async {
    final db = await database;
    final maps = await db.query('tasks');
    return maps.map((map) => TaskModel.fromMap(map)).toList();
  }

  Future<int> updateTask(TaskModel task) async {
    final db = await database;
    return await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
