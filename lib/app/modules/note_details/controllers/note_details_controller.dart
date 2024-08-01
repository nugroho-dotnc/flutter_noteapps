import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/app/data/model/note.dart';
import 'package:notes_app/app/data/model/note_database.dart';
import 'package:provider/provider.dart';

class NoteDetailsController extends GetxController {
  //TODO: Implement NoteDetailsController

  final titleController = TextEditingController();
  final descController = TextEditingController();
  dynamic argument = Get.arguments;
  late Note currentNote;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    currentNote = argument[0];
    titleController.text = currentNote.text;
    descController.text = currentNote.desc??" ";
  }

  @override
  void onReady() {
    super.onReady();

  }
  @override
  void onClose() {
    super.onClose();
  }
  void updateNote(){
    Get.context!.read<NoteDatabase>().updateNote(currentNote.id, titleController.text, descController.text);
    titleController.clear();
    descController.clear();
    Get.back();
  }
  void increment() => count.value++;
}
