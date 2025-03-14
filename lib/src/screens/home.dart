import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appBarMethod(),
    );
  }

  appBarMethod() {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      title: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                'ToDo App',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              _darkMode ? Icons.nightlight_round : Icons.wb_sunny,
              color: Colors.white,
            ),
            onPressed: () {
              _alternarTema();
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  onPressed: () {},
                  icon: const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _alternarTema() {
    setState(() {
      _darkMode = !_darkMode;
    });
  }
}
