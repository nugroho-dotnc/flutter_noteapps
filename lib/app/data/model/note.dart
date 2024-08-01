import 'package:isar/isar.dart';
//this file needed to generate file
//then run: dart run build_runner build
part 'note.g.dart';
@collection
class Note {
   Id id = Isar.autoIncrement;
   late String text;
   late String? desc;
   late DateTime? date;
}