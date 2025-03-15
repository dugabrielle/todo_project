import 'package:flutter/material.dart';
import 'package:todo_project/src/screens/home.dart';
import 'package:todo_project/src/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _darkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      home: HomeScreen(
        alternarTema: _alternarTema,
        darkMode: _darkMode,
      ),
    );
  }

  void _alternarTema() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }
}
