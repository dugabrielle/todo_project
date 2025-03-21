import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_project/src/model/todo.dart';
import 'package:todo_project/src/widgets/task_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.alternarTema, required this.darkMode});

  final VoidCallback alternarTema;
  final bool darkMode;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ToDo> tarefas = [
    ToDo(id: '1', titulo: 'Treinar', descricao: '1 hora', checkbox: false),
    ToDo(id: '2', titulo: 'Estudar', descricao: '3 horas', checkbox: false),
    ToDo(
        id: '3',
        titulo: 'Escutar música',
        descricao: 'Youtube',
        checkbox: false),
  ];

  List<ToDo> _filtrarNota = [];

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filtrarNota = tarefas;
  }

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
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                if (tarefas.where((todo) => !todo.checkbox).isEmpty)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Text(
                        'Nenhuma tarefa encontrada.',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                Column(
                  children: [
                    for (var todo in tarefas.where((todo) => !todo.checkbox))
                      TaskCheckbox(
                        todo: todo,
                        completarTarefa: completarTarefa,
                        excluirTarefa: excluirTarefa,
                        editarTarefa: editarTarefa,
                      ),
                  ],
                ),
                if (tarefas.where((todo) => todo.checkbox).isNotEmpty) ...[
                  const Divider(color: Colors.grey),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tarefas Concluídas',
                      style: GoogleFonts.comicNeue(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
                Column(
                  children: [
                    for (var todo in tarefas.where((todo) => todo.checkbox))
                      TaskCheckbox(
                        todo: todo,
                        completarTarefa: completarTarefa,
                        excluirTarefa: excluirTarefa,
                        editarTarefa: editarTarefa,
                      ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 15, right: 15, left: 10),
              width: 80,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  minimumSize: const Size(50, 50),
                ),
                child: Icon(
                  Icons.add,
                  size: 28,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void completarTarefa(ToDo todo) {
    setState(() {
      todo.checkbox = !todo.checkbox;
    });
  }

  void excluirTarefa(String id) {
    setState(() {
      tarefas.removeWhere((tarefa) => tarefa.id == id);
    });
  }

  void editarTarefa(ToDo todo) {
    // dialogoEdit
  }

  void filtrarNota(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        tarefas = _filtrarNota; // recupera a lista se o campo estiver vazio
      } else {
        tarefas = _filtrarNota
            .where((todo) =>
                todo.titulo.toLowerCase().contains(keyword.toLowerCase()) ||
                todo.descricao!.toLowerCase().contains(keyword.toLowerCase()))
            .toList();
      }
    });
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
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).colorScheme.primary,
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
        onChanged: filtrarNota,
        style: const TextStyle(color: Colors.grey),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 25),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: "Pesquisar",
          hintStyle: TextStyle(color: Colors.grey[700]),
        ),
      ),
    );
  }
}
