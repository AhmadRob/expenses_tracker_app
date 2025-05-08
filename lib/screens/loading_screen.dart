import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Bringing your data text.
          Padding(
            padding: const EdgeInsets.only(left: 47.0),
            child: Text(
              'Bringing\nyour\ndata',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Theme.of(context).colorScheme.surface,
                  letterSpacing: -4,
                  height: 1,
                ),
              ),
            ),
          ),
         ],
      ),
    );
  }
}
