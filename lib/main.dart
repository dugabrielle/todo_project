import 'package:flutter/material.dart';
import 'package:todo_project/src/screens/home.dart';
import 'package:todo_project/src/screens/login.dart';
import 'package:todo_project/src/screens/welcome.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(
              alternarTema: _alternarTema,
              darkMode: _darkMode, // adicionar dps o provider
            ),
        '/login': (context) => LoginScreen(
              alternarTema: _alternarTema,
              darkMode: _darkMode, // adicionar dps o provider
            ),
      },
    );
  }

  void _alternarTema() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }
}
