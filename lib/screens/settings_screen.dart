import 'package:expenses_tracker_app_v2/components/my_editable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/my_circle_avatar.dart';
import 'auth/login_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Settings text.
              Padding(
                padding: const EdgeInsets.only(right: 200.0, top: 45),
                child: Center(
                  child: Text(
                    'Settings',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 32,
                        color: Theme.of(context).colorScheme.inverseSurface,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 80,
              ),

              // User picture.
              const MyCircleAvatar(
                radius: 80,
                size: 80,
              ),

              // Personal information text.
              Padding(
                padding: const EdgeInsets.only(right: 100.0, top: 45),
                child: Center(
                  child: Text(
                    'Personal Information',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.inverseSurface,
                        letterSpacing: -1,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 35,
              ),

              // User name.
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: MyEditableTextField(hintText: 'UserName'),
              ),

              const SizedBox(
                height: 30,
              ),

              // Email.
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35,
                ),
                child: MyEditableTextField(hintText: 'example@gmail.com'),
              ),

              const SizedBox(
                height: 200,
              ),

              // Log out button.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ), // Correct navigation
                        );
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Theme.of(context).colorScheme.tertiary,
                        size: 40,
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ), // Correct navigation
                          );
                        },
                        child: Text(
                          'Logout',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
