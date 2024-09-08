import 'package:bookly_app/bookly_app.dart';
import 'package:bookly_app/core/di/dependecy_injection.dart';
import 'package:bookly_app/core/routing/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  setupGetIt();
  runApp(
    BooklyApp(
      appRoutes: AppRoutes(),
    ),
  );
}
