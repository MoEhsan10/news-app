import 'package:flutter/material.dart';
import 'package:news_app/my_app.dart';

import 'core/utils/di/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

