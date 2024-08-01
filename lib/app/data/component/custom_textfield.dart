import 'package:flutter/material.dart';

class TextareaTextfield extends StatelessWidget {
  const TextareaTextfield({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      keyboardType: TextInputType.multiline,
      maxLines: null, // Allow the text field to grow
      minLines: 6, // Minimum number of lines to display
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        contentPadding: EdgeInsets.all(8.0), // Padding inside the text field
        hintText: 'Enter text here',
      ),
      controller: controller,
    );
  }
}

class UlTextfield extends StatelessWidget {
  const UlTextfield({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      decoration:  InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        hintText: 'Enter text here',
      ),
      controller: controller,
    );
  }
}