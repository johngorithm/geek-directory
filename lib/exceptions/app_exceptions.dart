import 'dart:convert';

import 'package:http/http.dart';
import 'package:simple_logger/simple_logger.dart';

class TimeoutException implements Exception {
  dynamic message;

  TimeoutException([this.message]) {
    message ??= 'Network timeout exception';
  }
}

class GitHubStatusException implements Exception {
  SimpleLogger log = SimpleLogger();
  int statusCode;
  String message;

  GitHubStatusException(Response httpResponse) {
    var responseBody = httpResponse.body;

    var result;
    try {
      result = jsonDecode(responseBody);
    } on FormatException catch (e) {
      log.info("Non success error code has non json body. ${e.toString()}");
    }

    if (result is Map && (result['message'] != null)) {
      message = result['message'];
    } else {
      message = 'Something went wrong. Mind trying again?';
    }

    statusCode = httpResponse.statusCode;
  }
}


