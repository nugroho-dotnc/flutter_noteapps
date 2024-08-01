import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/app/data/model/note.dart';
import 'package:notes_app/app/data/model/isar_initializer.dart';
import 'package:notes_app/app/modules/home/views/note_view.dart';
import 'package:notes_app/app/modules/home/views/to_do_list_view.dart';
import 'package:provider/provider.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement HomeController
  late TabController tabController;
  List<Widget> page = [
    NoteView(),
    ToDoListView()
  ];
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: page.length, vsync: this, initialIndex: 0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }



}
