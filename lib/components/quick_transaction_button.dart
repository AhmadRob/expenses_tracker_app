import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../theme/Colors/app_colors.dart';

class QuickTransactionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double fontSize;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final EdgeInsets padding;

  const QuickTransactionButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.fontSize = 14,
    this.backgroundColor = PrimaryColors.primaryBlue,
    this.textColor = PrimaryColors.primaryPaige,
    this.borderRadius = 25.0,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Theme.of(context).colorScheme.surface,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text( text.length > 10
                    ? '${text.substring(0, 8)}...'
                    : text.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
