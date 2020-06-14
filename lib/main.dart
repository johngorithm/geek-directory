import 'package:flutter/material.dart';
import 'package:geekdirectory/app.dart';
import 'package:geekdirectory/services/service_api.dart';
import 'package:geekdirectory/services/service_locator.dart';

void main() {

  serviceLocator.registerSingleton(ServiceAPI());
  runApp(App());
}
