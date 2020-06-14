import 'dart:convert';
import 'package:http/http.dart';

class GeekResponse {
  List<Geek> geeks;

  GeekResponse({this.geeks});

  factory GeekResponse.fromJSON(Response response) {
    // todo: handle exceptions
    Map<String, dynamic> data = jsonDecode(response.body);

    List<Geek> _geeks  = [];
    if (data != null ) {
      List<dynamic> items = data['items'];
      _geeks = items.map((entry) => Geek.fromJSON(entry)).toList();
    }

    return GeekResponse(geeks: _geeks);
  }
}

class Geek {
  String username;
  String avatarUrl;

  Geek({this.avatarUrl, this.username});

  factory Geek.fromJSON(Map<String, dynamic> data) {
    return Geek(
      username: data['login'],
      avatarUrl: data['avatar_url'],
    );
  }
}
