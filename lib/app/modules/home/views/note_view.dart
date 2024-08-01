import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/component/notes_tile.dart';
import 'package:notes_app/app/data/model/note.dart';
import 'package:notes_app/app/data/model/isar_initializer.dart';
import 'package:notes_app/app/data/model/note_database.dart';
import 'package:notes_app/app/modules/home/controllers/note_controller.dart';
import 'package:provider/provider.dart';

class NoteView extends GetView<NoteController> {
  const NoteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNote = noteDatabase.currentNotes;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: controller.createNote,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add, size: 20, color: Colors.black,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Notes", style: GoogleFonts.dmSerifText(fontSize: 48, color: Theme.of(context).colorScheme.inversePrimary),),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNote.length,
              itemBuilder: (context, index) {
                final note = currentNote[index];
                return NotesTile(note: note);
              },),
          ),
        ],
      ),
    );
  }
}
