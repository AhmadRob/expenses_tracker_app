import 'package:expenses_tracker_app_v2/components/my_button.dart';
import 'package:expenses_tracker_app_v2/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Intro Text.
            Padding(
              padding: const EdgeInsets.only(
                top: 135,
              ),
              child: Text(
                'Let\'s track every qirsh!\nReady to get started?',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Theme.of(context).colorScheme.primary,
                  letterSpacing: 0,
                )),
              ),
            ),

            // Intro Picture.
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Image.asset(
                'assets/Red hair woman.png',
              ),
            ),

            // Enter Button.
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: MyButton(
                text: 'Let\'s dive in!',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ), // Correct navigation
                  );
                },
              ),
            ),

            const SizedBox(
              height: 24,
            ),

            // Privacy Policy Text.
            Text(
              'Privacy Policy',
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Theme.of(context).colorScheme.inverseSurface,
                letterSpacing: 0,
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 135,
              ),
              child: Text(
                'Your privacy and security are our top priorities.\nAll your information is encrypted and securely stored.\nRest assured your data is safe with us.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.inverseSurface,
                    letterSpacing: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
