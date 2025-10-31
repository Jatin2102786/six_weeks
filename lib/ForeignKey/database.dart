import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
      onConfigure: _onConfigure,
    );
  }

  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS restaurant(
      rest_id INTEGER PRIMARY KEY AUTOINCREMENT,
      rest_name TEXT NOT NULL,
      rest_address TEXT NOT NULL
      )
      ''');

    await db.execute('''
    CREATE TABLE IF NOT EXISTS orders(
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_name TEXT NOT NULL,
    rest_id INTEGER NOT NULL,
    FOREIGN KEY (rest_id) REFERENCES restaurant(rest_id) ON DELETE CASCADE
    
    ) 
    ''');
  }

  // insertion
  Future<int> insertRestaurant(String name, String address) async {
    Map<String, dynamic> restaurant = {
      'rest_name': name,
      'rest_address': address,
    };

    final db = await database;
    return await db.insert('restaurant', restaurant);
  }

  Future<int> insertOrder(String name, int rest_id) async {
    Map<String, dynamic> order = {'order_name': name, 'rest_id': rest_id};

    final db = await database;

    return db.insert('orders', order);
  }

  // get full list
  Future<List<Map<String, dynamic>>> getRestaurant() async {
    final db = await database;
    return db.query('restaurant');
  }

  Future<List<Map<String, dynamic>>> getOrder() async {
    final db = await database;
    return db.query('orders');
  }

  //   delete
  Future<int> deleteRestaurant(int id) async {

    final db = await database;
    return await db.delete('restaurant',where: 'rest_id = ?',whereArgs: [id]);
  }
}
