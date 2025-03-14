import 'package:flutter/material.dart';
import 'package:todo_project/src/model/todo.dart';

class TaskCheckbox extends StatelessWidget {
  final ToDo todo;
  final Function completarTarefa;
  final Function excluirTarefa;
  final Function editarTarefa;

  const TaskCheckbox({
    super.key,
    required this.todo,
    required this.completarTarefa,
    required this.excluirTarefa,
    required this.editarTarefa,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
