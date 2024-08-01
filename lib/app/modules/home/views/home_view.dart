import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/component/drawer.dart';
import 'package:notes_app/app/data/component/notes_tile.dart';
import 'package:notes_app/app/data/model/note.dart';
import 'package:notes_app/app/data/model/isar_initializer.dart';
import 'package:provider/provider.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      body: TabBarView(
        controller: controller.tabController,
        children: controller.page,
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface
          ),
          child: TabBar(
            controller: controller.tabController,
            unselectedLabelColor: Theme.of(context).colorScheme.secondary ,
            labelColor: Theme.of(context).colorScheme.inversePrimary,
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(vertical: 10, horizontal: MediaQuery.of(context).size.width/2 - 120),
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).colorScheme.primary
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.dashboard),
              ),
              Tab(
                icon: Icon(Icons.check_box_outlined),
              )
            ],
          ),
        ),
      )
      );
  }
}
