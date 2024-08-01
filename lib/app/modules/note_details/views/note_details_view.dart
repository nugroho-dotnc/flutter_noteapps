import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/add_on.dart';
import 'package:notes_app/app/data/component/custom_textfield.dart';

import '../controllers/note_details_controller.dart';

class NoteDetailsView extends GetView<NoteDetailsController> {
  const NoteDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title:  Text('Details', style: GoogleFonts.dmSerifText(color: Theme.of(context).colorScheme.inversePrimary),),
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => Get.back(),),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: ()=>controller.updateNote(),
              child: Text('Save', style: GoogleFonts.dmSerifText(color: Theme.of(context).colorScheme.inversePrimary),),
             style: ElevatedButton.styleFrom(
               backgroundColor: Theme.of(context).colorScheme.primary
             ),
            ),
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TransparentTextfield(hintText: "title ...", minLines: 1, controller: controller.titleController, style: GoogleFonts.dmSerifText(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w500, fontSize: 24),)
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                height: 1,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                AddOn.formatDate(controller.currentNote.date!),
                style: GoogleFonts.dmSans(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w300, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TransparentTextfield(hintText: "catatan ...", minLines: 8, maxLines: null, controller: controller.descController, style: GoogleFonts.dmSans(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w400, fontSize: 18))
            )
          ],
        )

    );
  }

  TextField TransparentTextfield({String? hintText, int? minLines, int?maxLines, TextEditingController? controller, TextStyle? style}) {
    final context = Get.context!;
    return TextField(
              cursorColor: Theme.of(context).colorScheme.inversePrimary,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: Theme.of(context).colorScheme.inversePrimary, fontWeight: FontWeight.w300), // Gaya teks hint
                border: InputBorder.none, // Menghilangkan border
                filled: true,
                fillColor: Colors.transparent, // Latar belakang transparan
                contentPadding: EdgeInsets.all(8.0), // Padding dalam TextField
              ),
              minLines: minLines,
              maxLines: maxLines,
              keyboardType: TextInputType.multiline,
              controller: controller,
              style: style // Gaya teks
            );
  }
}


