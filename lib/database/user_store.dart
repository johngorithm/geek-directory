
import 'package:flutter/foundation.dart';
import 'package:geekdirectory/models/user.dart';
import 'package:sqflite/sqflite.dart';

class UserStore with ChangeNotifier {
  static const tableName = 'User';
  Database _db;

  void load(Database database) {
    _db = database;
  }

  Future<int> insert(User user) async {
    // todo: verify insertion
    int insertionId = await _db.insert(
      tableName,
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return insertionId;
  }

  Future<int> update(User user) async {
    int count = await _db.update(
      tableName,
      user.toMap(),
      where: 'uuid = ?',
      whereArgs: [user.uuid]
    );

    if (count < 1) {
      return null;
    }
    return count;
  }

  Future<void> clear() async {
    await _db.delete("user");
    notifyListeners();
  }

  Future<User> getAuthenticatedUser() async {
    var records = await _db.query(
        tableName,
        where: 'is_authenticated = ?',
        whereArgs: [1]
    );

    if (records == null || records.isEmpty) {
      return null;
    }

    return User.fromJSON(records.first);
  }
}
