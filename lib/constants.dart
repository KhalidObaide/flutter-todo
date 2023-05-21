import 'package:flutter/material.dart';

ThemeData theme = ThemeData.dark().copyWith(
  useMaterial3: true,
  primaryColor: Colors.blueGrey[800],
  colorScheme:
      const ColorScheme.dark().copyWith(secondary: Colors.deepPurpleAccent),
);

class Todo {
  final String title;
  final String description;
  bool isDone;

  Todo({
    required this.title,
    required this.description,
  }) : isDone = false;
}
