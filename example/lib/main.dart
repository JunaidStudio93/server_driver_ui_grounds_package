import 'package:example/ui_builder_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ServerUIBuilder(),
      title: "UI Builder",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    ),
  );
}
