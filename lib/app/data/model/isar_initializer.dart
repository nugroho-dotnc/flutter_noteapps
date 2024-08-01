import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/app/data/model/note.dart';
import 'package:notes_app/app/data/model/todo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
class Initializer{
  static late Isar isar;
  //I N I T I A L I Z E -- DATABASE
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
        [NoteSchema, TodoSchema],
        directory: dir.path
    );
  }
}