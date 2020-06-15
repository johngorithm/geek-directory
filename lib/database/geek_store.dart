
import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:sqflite/sqflite.dart';

class GeekStore with ChangeNotifier {
  static const tableName = 'ViewedGeeks';
  Database _db;

  void load(Database database) {
    _db = database;
  }

  Future<GeekDetail> getByUsername(String username) async {
    var records = await _db.query(
        tableName,
        where: 'username = ?',
        whereArgs: [username],
    );

    if ((records ?? []).length < 1) {
      return null;
    }

    return GeekDetail.fromJSON(records.first);
  }

  Future<GeekDetail> insert(GeekDetail geekDetail) async {
    int id = await _db.insert(
      tableName,
      geekDetail.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    geekDetail.id = id;
    return geekDetail;
  }

  Future<int> update(GeekDetail geekDetail) async {
    int count = await _db.update(
        tableName,
        geekDetail.toMap(),
        where: 'username = ?',
        whereArgs: [geekDetail.username]
    );

    if (count < 1) {
      return null;
    }
    return count;
  }

  Future<List<GeekDetail>> all() async {
    var records = await _db.rawQuery("SELECT * from $tableName");
    return records.map((entry) => GeekDetail.fromJSON(entry)).toList();
  }

  Future<void> clear() async {
    await _db.delete("user");
    notifyListeners();
  }
}
