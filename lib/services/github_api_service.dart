
import 'dart:io';

import 'package:geekdirectory/exceptions/app_exceptions.dart';
import 'package:geekdirectory/models/geek_response.dart';
import 'package:http/http.dart' as http;
import 'package:simple_logger/simple_logger.dart';

class GithubApiService {
  int userId;
  SimpleLogger _logger = SimpleLogger();
  static const String baseUrl = 'https://api.github.com';



  Future<GeekResponse> loadGeeks() async {
    try {
      final http.Response response = await http.get(
          '$baseUrl/search/users?q=+language:java+location:nairobi&per_page=100',

          headers: <String, String>{
            'Content-Type': 'application/json',
          });

      throwOnFailureCodeException(response);

      /// If all is good, return response
      return GeekResponse.fromJSON(response);

    } on http.ClientException catch(e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch(e) {
      throw SocketException("IOException has occurred: $e");
    }
  }

  Future<GeekResponse> loadGeekProfile(String username) async {
    try {
      final http.Response response = await http.get(
          '$baseUrl/users/$username?client_id=694ce0aafdfbc47ad583&client_secret=58709f1741ce72e8102a05b41412b38750bf1cd0',

          headers: <String, String>{
            'Content-Type': 'application/json',
          });

      throwOnFailureCodeException(response);

      /// If all is good, return response
      return GeekResponse.fromJSON(response);

    } on http.ClientException catch(e) {
      throw SocketException("ClientException has occurred: $e");
    } on IOException catch(e) {
      throw SocketException("IOException has occurred: $e");
    }
  }


  void throwOnFailureCodeException(http.Response response) {

    _logger.fine('\n\n Server Response to ${response.request.url.path} ==> '
        'StatusCode: ${response.statusCode}, Body: ${response.body} \n\n');

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw GitHubStatusException(response);
    }
  }


}
