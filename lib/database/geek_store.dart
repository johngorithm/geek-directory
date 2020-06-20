
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
        where: 'login = ?',
        whereArgs: [username],
    );

    if ((records ?? []).length < 1) {
      return null;
    }

    return GeekDetail.fromJSON(records.first);
  }

  Future<List<GeekDetail>> getFavorited() async {
    var records = await _db.query(
      tableName,
      where: 'is_favorited = ?',
      whereArgs: [1],
    );

    if ((records ?? []).length < 1) {
      return null;
    }

    return records.map((entry) => GeekDetail.fromJSON(entry)).toList();
  }

  Future<GeekDetail> insert(GeekDetail geekDetail) async {
    await _db.insert(
      tableName,
      geekDetail.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace
    );

    notifyListeners();
    return geekDetail;
  }

  Future<int> update(GeekDetail geekDetail) async {
    print(geekDetail.toMap());
    int count = await _db.update(
        tableName,
        geekDetail.toMap(),
        where: 'login = ?',
        whereArgs: [geekDetail.username]
    );
    notifyListeners();
    return count;
  }

  Future<List<GeekDetail>> all() async {
    var records = await _db.rawQuery("SELECT * from $tableName");
    return records.map((entry) => GeekDetail.fromJSON(entry)).toList();
  }

  Future<void> clear() async {
    await _db.delete(tableName);
    notifyListeners();
  }
}
