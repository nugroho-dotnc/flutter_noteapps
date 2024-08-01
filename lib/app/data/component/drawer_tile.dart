import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final void Function()? onTap;
   DrawerTile({super.key, required this.title, required this.leading, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListTile(
        title: Text(title, style: GoogleFonts.dmSans(color: Theme.of(context).colorScheme.inversePrimary),),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}
