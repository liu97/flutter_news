import 'dart:async';
import 'dart:io';

import 'package:sqflite/sqflite.dart';

// 数据库管理工具，主要做数据库的初始化、提供isTableExits查询、getCurrentDatabase函数
class DbManager {
  static const _VERSION = 1;
  static const _NAME = "flutter_news.db";
  static Database _database;
  // 初始化
  static _init() async {
    // 打开数据库
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + _NAME;
    if (Platform.isIOS) {
      path = databasesPath + "/" + _NAME;
    }
    _database = await openDatabase(path, version: _VERSION,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      //await db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)");
    });
  }

  static isTableExits(String tableName) async {
    await getCurrentDatabase();
    var res = await _database.rawQuery(
        "select * from Sqlite_master where type = 'table' and name = '$tableName'");
    return res != null && res.length > 0;
  }

  // 获取当前数据库对象
  static Future<Database> getCurrentDatabase() async {
    if (_database == null) {
      await _init();
    }
    return _database;
  }

  // 关闭
  static close() {
    _database?.close();
    _database = null;
  }
}