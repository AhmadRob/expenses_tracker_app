import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/Colors/app_colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final double fontSize;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16,
    this.backgroundColor = PrimaryColors.primaryBlue,
    this.textColor = PrimaryColors.primaryPaige,
    this.borderRadius = 50.0,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent, // Make the Material widget transparent
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: Padding(
            padding: padding,
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
