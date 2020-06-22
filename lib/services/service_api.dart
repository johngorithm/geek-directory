
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geekdirectory/database/local_db.dart';
import 'package:geekdirectory/models/geek.dart';
import 'package:geekdirectory/models/geek_detail.dart';
import 'package:geekdirectory/models/geek_profile_response.dart';
import 'package:geekdirectory/models/geek_response.dart';
import 'package:geekdirectory/models/user.dart';
import 'package:geekdirectory/services/firebase_service.dart';
import 'package:geekdirectory/services/github_api_service.dart';
import 'package:geekdirectory/services/share_service.dart';
import 'package:simple_logger/simple_logger.dart';

class ServiceAPI {
  int userId;

  @visibleForTesting
  GithubApiService githubService;

  @visibleForTesting
  FirebaseService firebaseService;

  @visibleForTesting
  ShareService shareService;

  @visibleForTesting
  LocalDB db;

  SimpleLogger logger = SimpleLogger();

  ServiceAPI({this.githubService, this.db, this.firebaseService, this.shareService}) {
    githubService ??= GithubApiService();
    firebaseService ??= FirebaseService();
    db ??= LocalDB();
    shareService ??= ShareService();
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

  Future<List<GeekDetail>> getFavoriteGeeks() async {
    return db.geekStore.getFavorited();
  }

  Future<List<GeekDetail>> getViewedGeeks() async {
    return db.geekStore.all();
  }

  Future<void> finishOnboarding() async {

  }

  Future<User> get authenticatedUser async {
    return db.userStore.getAuthenticatedUser();
  }


  Future<int> favoriteGeek(GeekDetail geekDetail) async {
    return db.geekStore.update(geekDetail);
  }

  Future<User> registerUser(String email, String password) async {
    FirebaseUser fbUser = await firebaseService.registerUser(email, password);

    if (fbUser == null) return null;

    User appUser = User(
      uuid: fbUser.uid,
      email: fbUser.email,
      name: fbUser.displayName,
      profileImage: fbUser.photoUrl,
      hasCompletedOnboarding: true,
      isAuthenticated: true,
    );

    int insertionId = await db.userStore.insert(appUser);
    if ((insertionId ?? 0) < 1) {
      return null;
    }

    return appUser;
  }

  Future<User> loginUser(String email, String password) async {
    var fbUser = await firebaseService.authenticateUser(email, password);

    if (fbUser == null) return null;

    User appUser = User(
      uuid: fbUser.uid,
      email: fbUser.email,
      name: fbUser.displayName,
      profileImage: fbUser.photoUrl,
      hasCompletedOnboarding: true,
      isAuthenticated: true,
    );

    int insertionId = await db.userStore.insert(appUser);
    if ((insertionId ?? 0) < 1) {
      return null;
    }

    return appUser;
  }

  Future<User> getUserProfile() async {
    return authenticatedUser;
  }

  Future<void> logOut() async {
    await db.clear();
    await firebaseService.signOut();
    userId = null;
  }

  Future<void> shareGeekProfile(String text, {String subject}) async {
    await shareService.share(text, subject: subject);
  }

  Future<void> getImageForUpload() async {

  }

  Future<void> uploadProfileImage() async {

  }
}
