import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/app/data/component/drawer_tile.dart';
import 'package:notes_app/app/modules/home/views/settings_view.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //icon
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text("Notes app", style: GoogleFonts.dmSerifText(fontSize: 34, color: Theme.of(context).colorScheme.inversePrimary),),
          ),
          SizedBox(height: 30,),
          //drawer tile
          DrawerTile(
              title: "notes",
              leading: Icon(Icons.home, color: Theme.of(context).colorScheme.inversePrimary,),
              onTap: ()=>Navigator.pop(context),
          ),
          DrawerTile(
              title: "settings",
              leading: Icon(Icons.settings, color: Theme.of(context).colorScheme.inversePrimary),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsView(),));
              },
          )

        ],
      ),
    );
  }
}
