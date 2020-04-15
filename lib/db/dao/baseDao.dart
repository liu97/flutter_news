import 'dart:async';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import '../dbManager.dart';


///基类
abstract class BaseDao {
  bool isTableExits = false;

  tableSqlString();

  tableName();

  tableBaseString(String name, String idColumn) {
    return '''
        create table $name (
        $idColumn integer primary key autoincrement,
      ''';
  }

  Future<Database> getDataBase() async {
    return await open();
  }

  @mustCallSuper
  prepare(name, String createSql) async {
    isTableExits = await DbManager.isTableExits(name);
    if (!isTableExits) {
      Database db = await DbManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  @mustCallSuper
  open() async {
    if (!isTableExits) {
      await prepare(tableName(), tableSqlString());
    }
    return await DbManager.getCurrentDatabase();
  }
}
