import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension BuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  GoRouter get router => GoRouter.of(this);
  bool get isDark => MediaQuery.of(this).platformBrightness == Brightness.dark;
}

extension StringExtension on String {
  String get path => "/$this";
}
