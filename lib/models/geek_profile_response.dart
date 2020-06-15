
import 'dart:convert';

import 'package:geekdirectory/models/geek_detail.dart';
import 'package:http/http.dart';

class GeekProfileResponse {
  GeekDetail profile;

  GeekProfileResponse(this.profile);

  factory GeekProfileResponse.fromJSON(Response response) {
    // todo: handle exceptions
    Map<String, dynamic> data = jsonDecode(response.body);

    GeekDetail _profile;
    
    if (data != null) {
      _profile = GeekDetail.fromJSON(data);
    }

    return GeekProfileResponse(_profile);
  }
}