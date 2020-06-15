import 'dart:convert';
import 'package:geekdirectory/models/geek.dart';
import 'package:http/http.dart';

class GeekResponse {
  List<Geek> geeks;

  GeekResponse(this.geeks);

  factory GeekResponse.fromJSON(Response response) {
    // todo: handle exceptions
    Map<String, dynamic> data = jsonDecode(response.body);

    List<Geek> _geeks  = [];
    if (data != null ) {
      List<dynamic> items = data['items'];
      _geeks = items.map((entry) => Geek.fromJSON(entry)).toList();
    }

    return GeekResponse(_geeks);
  }
}
