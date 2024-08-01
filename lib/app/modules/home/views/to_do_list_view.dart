import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/component/todo_tiles.dart';
import 'package:notes_app/app/data/model/isar_initializer.dart';
import 'package:notes_app/app/data/model/todo.dart';
import 'package:notes_app/app/data/model/todo_database.dart';
import 'package:notes_app/app/modules/home/controllers/todo_controller.dart';
import 'package:provider/provider.dart';

class ToDoListView extends GetView<TodoController> {
  const ToDoListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final todoDatabase = context.watch<TodoDatabase>();
    List<Todo> currentTodo = todoDatabase.currentTodo;
    return  Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: controller.createTodo,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: const Icon(Icons.add, size: 20, color: Colors.black,),
        ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("To do list", style: GoogleFonts.dmSerifText(fontSize: 48, color: Theme.of(context).colorScheme.inversePrimary),),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentTodo.length,
              itemBuilder: (context, index) {
                final todo = currentTodo[index];
              return TodoTiles(
                todo: todo,
                onChange: (value) {
                  controller.updateNote(todo.id, value??false);
                },
              );
            },),
          )
        ],
      )
    );
  }
}
