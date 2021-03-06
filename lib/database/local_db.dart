import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/database/geek_store.dart';
import 'package:geekdirectory/database/user_store.dart';
import 'package:geekdirectory/services/service_locator.dart';
import 'package:sqflite/sqflite.dart';

class LocalDB {
  Database database;
  UserStore userStore;
  GeekStore geekStore;

  LocalDB._privateConstructor() :
    userStore = UserStore(),
    geekStore = GeekStore() {
    serviceLocator.registerSingleton(userStore);
    serviceLocator.registerSingleton(geekStore);
  }

  /// Singleton instance
  static final LocalDB _instance = LocalDB._privateConstructor();

  /// factory constructor
  factory LocalDB() => _instance;

  /// Possible use case should while testing
  @visibleForTesting
  factory LocalDB.asNewInstance() => LocalDB._privateConstructor();

  /// Loads the local database.
  Future<void> loadDb() async {
    var dbPath = await getDatabasesPath();
    String fullPath = '$dbPath/geek_app_db';

    database = await openDatabase(fullPath, version: 1,
      onCreate: _onCreate, onUpgrade: _onUpgrade);

    /// Init local stores
    userStore.load(database);
    geekStore.load(database);
  }

  FutureOr<void> _onCreate(database, version) async {
    await database.execute('''CREATE TABLE ViewedGeeks (
          id INTEGER NOT NULL,
          name TEXT,
          login TEXT NOT NULL PRIMARY KEY UNIQUE,
          followers INTEGER,
          following INTEGER,
          bio TEXT,
          location TEXT,
          company TEXT,
          avatar_url TEXT NOT NULL,
          public_gists INTEGER,
          public_repos INTEGER,
          is_favorited INTEGER
        )''');

    await database.execute('''CREATE TABLE User (
           uuid TEXT PRIMARY KEY UNIQUE,
           email TEXT NOT NULL,
           name TEXT,
           profile_image TEXT,
           has_completed_onboarding INTEGER,
           is_authenticated INTEGER
        )''');
  }

  FutureOr<void> _onUpgrade(database, oldVersion, newVersion) async {
    // TODO: Implement once version changes;
  }

  Future<void> clear() async {
    await userStore.clear();
    await geekStore.clear();
  }
}