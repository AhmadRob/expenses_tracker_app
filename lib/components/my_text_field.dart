import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  const MyTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Upper Text (Label)
        Text(
          labelText,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
        ),
        const SizedBox(height: 4), // Spacing between label and text field
        // Text Field
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            // Hint text
            hintStyle: GoogleFonts.poppins(
                textStyle: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.inverseSurface,
            )),
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
      ],
    );
  }
}
