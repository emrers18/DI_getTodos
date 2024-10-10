import 'package:flutter/material.dart';
import 'package:get_todos/app.dart';
import 'package:get_todos/core/di/di.dart';

void main() {
  setupLocator();
  runApp(const App());
}


