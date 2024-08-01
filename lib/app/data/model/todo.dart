import 'package:isar/isar.dart';
//this file needed to generate file
//then run: dart run build_runner build
part 'todo.g.dart';
@collection
class Todo {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isChecked;
  late DateTime date;
}