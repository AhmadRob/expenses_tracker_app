import 'package:expenses_tracker_app_v2/components/my_button.dart';
import 'package:expenses_tracker_app_v2/components/my_circle_avatar.dart';
import 'package:expenses_tracker_app_v2/components/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                  'Hello!',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 45,
                    color: Theme.of(context).colorScheme.surface,
                    letterSpacing: -4,
                  )),
                ),
              ),
              // Lower Part of the Screen.
            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.6,
            maxChildSize: 0.8,
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Profile Picture Circle
                        const MyCircleAvatar(
                          size: 60,
                          radius: 60,
                        ),

                        const SizedBox(height: 20),
                        // Name Text Field
                        const MyTextField(
                          labelText: 'Name',
                          hintText: 'Your Name, e.g : John Doe',
                        ),

                        const SizedBox(height: 30),

                        // Email Text Field
                        const MyTextField(
                          labelText: 'Email',
                          hintText: 'Your email, e.g : johndoe@gmail.com',
                        ),

                        const SizedBox(height: 30),

                        // Password Text Field
                        const MyTextField(
                          labelText: 'Password',
                          hintText: 'Your password, at least 8 character.',
                          obscureText: true,
                        ),

                        const SizedBox(height: 30),

                        // Confirm password Text Field
                        const MyTextField(
                          labelText: 'Confirm Password',
                          hintText: 'Re-type your password.',
                          obscureText: true,
                        ),

                        const SizedBox(height: 50),

                        MyButton(text: 'Register', onPressed: () {}),

                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already registered? ',
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                              )),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ), // Correct navigation
                                );
                              },
                              child: Text(
                                'Login here',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.primary,
                                )),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
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
