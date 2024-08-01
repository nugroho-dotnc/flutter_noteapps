import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/app/data/model/isar_initializer.dart';
import 'package:notes_app/app/data/model/todo.dart';

class TodoDatabase extends ChangeNotifier{
  // T O D O SECTION
  final isar = Initializer.isar;
  final List<Todo> currentTodo = [];
  // C R E A T E - a note and save it
  Future<void> createTodo(String noteFromUser) async {
    //create a new note object
    final newTodo = Todo();
    newTodo.text = noteFromUser;
    newTodo.isChecked = false;
    newTodo.date = DateTime.now();
    //save to db
    await isar.writeTxn(() => isar.todos.put(newTodo));

    //re-read from db
    fetchTodo();
  }
  // R E A D - a note from db
  Future<void> fetchTodo() async{
    List<Todo> fetchedTodo = await isar.todos.where().sortByIsChecked().thenByDateDesc().findAll();
    currentTodo.clear();
    currentTodo.addAll(fetchedTodo);
    notifyListeners();
  }
  // U P D A T E - a note that u choose in db
  Future<void> updateTodo(Id id, bool isChecked) async {
    final existingTodo = await isar.todos.get(id);
    if(existingTodo != null){
      existingTodo.isChecked = isChecked;
      await isar.writeTxn(() => isar.todos.put(existingTodo),);
      await fetchTodo();
    }
    notifyListeners();
  }
  //D E L E T E - a note note from the db
  Future<void> deleteTodo(Id id) async {
    final existingNote = await isar.todos.get(id);
    if(existingNote != null){
      await isar.writeTxn(() => isar.todos.delete(id),);
      await fetchTodo();
    }
  }
}