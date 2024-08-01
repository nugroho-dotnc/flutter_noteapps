import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/app/data/model/isar_initializer.dart';

import 'note.dart';

class NoteDatabase extends ChangeNotifier{
  final isar = Initializer.isar;
//list of notes
  final List<Note> currentNotes = [];
  // C R E A T E - a note and save it
  Future<void> create(String noteFromUser) async {
    //create a new note object
    final newNote = Note();
    newNote.text = noteFromUser;
    newNote.desc = "";
    newNote.date = DateTime.now();
    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote),);

    //re-read from db
    fetchNote();
  }
  // R E A D - a note from db
  Future<void> fetchNote() async{
    List<Note> fetchedNote = await isar.notes.where().sortByDateDesc().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNote);
    notifyListeners();
  }
  // U P D A T E - a note that u choose in db
  Future<void> updateNote(Id id, String newText, String? desc) async {
    final existingNote = await isar.notes.get(id);
    if(existingNote != null){
      existingNote.text = newText;
      existingNote.desc = desc;
      existingNote.date = DateTime.now();
      await isar.writeTxn(() => isar.notes.put(existingNote),);
      await fetchNote();
    }
  }
  //D E L E T E - a note note from the db
  Future<void> deleteNotes(Id id) async {
    final existingNote = await isar.notes.get(id);
    if(existingNote != null){
      await isar.writeTxn(() => isar.notes.delete(id),);
      await fetchNote();
    }
  }
}