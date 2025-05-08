import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

class MyEditableTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const MyEditableTextField({
    super.key,
    this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text field.
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'UserName',
              // Hint text
              hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              focusColor: Theme.of(context).colorScheme.inverseSurface,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.inverseSurface,
                  width: 1.0,
                ),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue, // Color when focused
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
        // Edit icon.
        IconButton(
          onPressed: () {},
          icon: Icon(
            HeroIcons.pencil_square,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
      ],
    );
  }
}
