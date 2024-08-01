import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/app/data/model/isar_initializer.dart';
import 'package:notes_app/app/data/model/todo_database.dart';
import 'package:provider/provider.dart';

class TodoController extends GetxController {
  //TODO: Implement TodoController
  TextEditingController textController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
    readTodo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void createTodo() {
    showDialog(
      context: Get.context!,
      builder: (context) =>
          AlertDialog(
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .background,
            title: Text(
              "Create Note", style: GoogleFonts.dmSerifText(color: Theme
                .of(context)
                .colorScheme
                .inversePrimary),),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            content: TextField(
              cursorColor: Theme
                  .of(context)
                  .colorScheme
                  .inversePrimary,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Theme
                      .of(context)
                      .colorScheme
                      .inversePrimary),
                ),
                hintText: 'Enter text here',
              ),
              controller: textController,
            ),
            actions: [
              MaterialButton(onPressed: () {
                context.read<TodoDatabase>().createTodo(textController.text);
                textController.clear();
                Navigator.pop(context);
              },
                child: const Text("create"),
              )
            ],
          ),);
  }

  //read note
  void readTodo() {
    Get.context!.read<TodoDatabase>().fetchTodo();
  }

  //update note
  void updateNote(Id id, bool isChecked){
    Get.context!.read<TodoDatabase>().updateTodo(id, isChecked);
  }
  //delete note
  void deleteNote(Id id) {
    showDialog(context: Get.context!, builder: (context) {
      return AlertDialog(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .background,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        title: Center(child: Text("ALERT !", style: GoogleFonts.dmSerifText(
            fontWeight: FontWeight.bold, color: Theme
            .of(context)
            .colorScheme
            .inversePrimary),)),
        content: Text("data yang dihapus tidak dapat di restore, anda yakin?",
          style: GoogleFonts.dmSans(fontWeight: FontWeight.w300, color: Theme
              .of(context)
              .colorScheme
              .inversePrimary),),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(onPressed: () => Get.back(),
                    style: ElevatedButton.styleFrom(backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary),
                    child: Text("no", style: GoogleFonts.dmSans(color: Theme
                        .of(context)
                        .colorScheme
                        .primary))),
              ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(onPressed: () {
                  context.read<TodoDatabase>().deleteTodo(id);
                  Navigator.pop(context);
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Theme
                        .of(context)
                        .colorScheme
                        .primary),
                    child: Text("yes", style: GoogleFonts.dmSans(color: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary))),
              ),

            ],
          )
        ],
      );
    },);
  }
}
