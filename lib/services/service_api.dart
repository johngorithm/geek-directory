
import 'package:geekdirectory/models/geek_profile.dart';
import 'package:geekdirectory/models/geek_profile_response.dart';
import 'package:geekdirectory/models/geek_response.dart';
import 'package:geekdirectory/services/github_api_service.dart';

class ServiceAPI {
  int userId;
  GithubApiService githubService;

  ServiceAPI({this.githubService}) {
    githubService ??= GithubApiService();
  }

  Future<List<Geek>> loadGeeks({bool fetchRemote = true}) async {
    GeekResponse geekResponse =  await githubService.loadGeeks();
    return geekResponse.geeks;
  }

  Future<GeekProfile> loadDevProfile(String username) async {
    GeekProfileResponse geekResponse =  await githubService.loadGeekProfile(username);
    return geekResponse.profile;
  }

  Future<void> auth(String username, String password) async {

  }

  Future<List<Geek>> getFavoriteGeeks() async {
    return null;
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
