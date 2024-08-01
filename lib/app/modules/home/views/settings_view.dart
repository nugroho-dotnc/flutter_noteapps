import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsView extends GetView {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Settings', style: GoogleFonts.dmSerifText(color: Theme.of(context).colorScheme.inversePrimary),),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: () => Get.back(),),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Darkmode", style: GoogleFonts.dmSans(fontSize: 18),),
                //switch toggle
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                  // activeColor: Theme.of(context).colorScheme.primary,
                  onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
