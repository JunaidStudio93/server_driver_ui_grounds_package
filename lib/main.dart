import 'package:flutter/material.dart';
import 'package:server_driver_ui_grounds/app_theme.dart';
import 'package:server_driver_ui_grounds/ui_builder_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: ServerUIBuilder(),
      title: "UI Builder",
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    ),
  );
}
