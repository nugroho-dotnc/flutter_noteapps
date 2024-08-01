import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/model/note.dart';
import 'package:notes_app/app/modules/home/controllers/home_controller.dart';
import 'package:notes_app/app/modules/home/controllers/note_controller.dart';
import 'package:notes_app/app/routes/app_pages.dart';

class NotesTile extends StatelessWidget {
  final Note note;
  const NotesTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final NoteController controller = Get.find();
    return Container(
      margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        onTap: () =>  Get.toNamed(Routes.NOTE_DETAILS, arguments: [note]),
        onLongPress: () => controller.deleteNote(note.id),
        title: Text(note.text, style: GoogleFonts.dmSans(),),
      ),
    );
  }
}
