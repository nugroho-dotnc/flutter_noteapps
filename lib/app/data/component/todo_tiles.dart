import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/model/todo.dart';
import 'package:notes_app/app/modules/home/controllers/todo_controller.dart';

class TodoTiles extends StatelessWidget {
  const TodoTiles({super.key, required this.onChange, required this.todo});
  final Todo todo;
  final Function(bool? value) onChange;
  @override
  Widget build(BuildContext context) {
    TodoController controller = Get.find();
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        color: todo.isChecked?Theme.of(context).colorScheme.inversePrimary:Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(todo.text, style: GoogleFonts.dmSans(color: todo.isChecked? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.inversePrimary),),
        trailing: Checkbox(
          activeColor: Theme.of(context).colorScheme.primary,
          side: BorderSide(
            color: Theme.of(context).colorScheme.inversePrimary,
            width: 2,
            style: BorderStyle.solid
          ),
          checkColor: Theme.of(context).colorScheme.inversePrimary,
          value: todo.isChecked,
          onChanged: onChange,
        ),
        onLongPress: () => controller.deleteNote(todo.id),
      ),
    );
  }
}
