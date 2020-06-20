
import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/database/local_db.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/models/geek_profile_response.dart';
import 'package:geekdirectory/models/geek_response.dart';
import 'package:geekdirectory/services/github_api_service.dart';
import 'package:simple_logger/simple_logger.dart';

class ServiceAPI {
  int userId;

  @visibleForTesting
  GithubApiService githubService;

  @visibleForTesting
  LocalDB db;

  SimpleLogger logger = SimpleLogger();

  ServiceAPI({this.githubService, this.db}) {
    githubService ??= GithubApiService();
    db ??= LocalDB();
  }

  Future<void> initDb() async {
    return db.loadDb();
  }

  Future<List<Geek>> loadGeeks({bool fetchRemote = true}) async {
    GeekResponse geekResponse =  await githubService.loadGeeks();
    return geekResponse.geeks;
  }

  Future<GeekDetail> loadGeekProfile(String username) async {
    var geek = await db.geekStore.getByUsername(username);

    if (geek != null) {
      return geek;
    }

    GeekProfileResponse geekResponse =  await githubService.loadGeekProfile(username);
    if (geekResponse.profile != null) {
      await db.geekStore.insert(geekResponse.profile);
    }

    return geekResponse.profile;
  }

  Future<void> auth(String username, String password) async {

  }

  Future<List<GeekDetail>> getFavoriteGeeks() async {
    return db.geekStore.getFavorited();
  }

  Future<void> getViewGeeks() async {

  }

  Future<void> finishOnboarding() async {

  }

  Future<void> get hasCompletedOnboarding async {

  }

  Future<void> get authenticatedUser async {

  }

  Future<void> getImageForUpload() async {

  }

  Future<void> uploadProfileImage() async {

  }
}
