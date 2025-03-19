import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.alternarTema, required this.darkMode});

  final VoidCallback alternarTema;
  final bool darkMode;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: appBarMethod(context),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                buscarNota(),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Tarefas',
                    style: GoogleFonts.comicNeue(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.secondary,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarMethod(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
      elevation: 0,
      automaticallyImplyLeading: false,
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
              widget.darkMode ? Icons.nightlight_round : Icons.wb_sunny,
            ),
            onPressed: widget.alternarTema,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buscarNota() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) {
          // a func filtro irá aqui
        },
        style: TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 25),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: "Pesquisar",
        ),
      ),
    );
  }
}
