
import 'dart:convert';

import 'package:geekdirectory/models/geek_profile.dart';
import 'package:http/http.dart';

class GeekProfileResponse {
  GeekProfile profile;

  GeekProfileResponse(this.profile);

  factory GeekProfileResponse.fromJSON(Response response) {
    // todo: handle exceptions
    Map<String, dynamic> data = jsonDecode(response.body);

    GeekProfile _profile;
    
    if (data != null) {
      _profile = GeekProfile.fromJSON(data);
    }

    return GeekProfileResponse(_profile);
  }
}