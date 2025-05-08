import 'package:expenses_tracker_app_v2/components/my_button.dart';
import 'package:expenses_tracker_app_v2/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class SendingCodeScreen extends StatelessWidget {
  const SendingCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 87.0),

              // Title Section
              Padding(
                padding: const EdgeInsets.only(left: 47.0),
                child: Text(
                  'Check\nYour email!',
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
              // Lower Part of the Screen.
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.6,
            maxChildSize: 0.75,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),

                        // The Code Text Field
                        const MyTextField(
                          labelText: 'The Code We Sent',
                          hintText: 'e.g : 678942',
                        ),

                        const SizedBox(height: 30),

                        // Password Text Field
                        const MyTextField(
                          labelText: 'Your New Password',
                          hintText: 'Enter Your New Password.',
                          obscureText: true,
                        ),

                        const SizedBox(height: 50),

                        MyButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
