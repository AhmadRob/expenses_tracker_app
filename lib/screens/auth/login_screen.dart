import 'package:expenses_tracker_app_v2/components/my_button.dart';
import 'package:expenses_tracker_app_v2/components/my_text_field.dart';
import 'package:expenses_tracker_app_v2/screens/auth/forgot_password_screen.dart';
import 'package:expenses_tracker_app_v2/screens/auth/register_screen.dart';
import 'package:expenses_tracker_app_v2/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                  'Welcome\nback!',
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

                        const SizedBox(height: 50),

                        MyButton(
                          text: 'Login',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MainScreen(),
                              ), // Correct navigation
                            );
                          },
                        ),

                        const SizedBox(height: 25),

                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ), // Correct navigation
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 150.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordScreen(),
                                  ), // Correct navigation
                                );
                              },
                              child: Text(
                                'Forgot your password?',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                )),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New here? ',
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
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ), // Correct navigation
                                );
                              },
                              child: Text(
                                'Let\'s get you signed up',
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
