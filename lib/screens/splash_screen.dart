import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Xpenso',
              style: GoogleFonts.poppins(textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: -4,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
