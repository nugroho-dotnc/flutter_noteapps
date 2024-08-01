import 'package:get/get.dart';

import 'package:notes_app/app/modules/home/controllers/note_controller.dart';
import 'package:notes_app/app/modules/home/controllers/todo_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(
      () => TodoController(),
    );
    Get.lazyPut<NoteController>(
      () => NoteController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
