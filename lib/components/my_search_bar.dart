import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/user_data.dart';
import '../theme/Colors/app_colors.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,),
      child: Container(
        decoration: BoxDecoration(
          color: PrimaryColors.veryLightPurple,
          // Background color of the search bar
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            // Remove the default underline
            hintText: 'Type the name, date or comment.',
            // Hint text
            hintStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: Theme.of(context).colorScheme.inverseSurface,
                letterSpacing: 0,
              ),
            ),
            suffixIcon: Icon(
              Icons.search, // Search icon
              size: 35, // Icon size
              color: UserData().selectedAccount.accountColor, // Icon color
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            label: RichText(
              text: TextSpan(
                text: 'Search by ', // Bigger font text
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: UserData().selectedAccount.accountColor,
                    letterSpacing: 0,
                  ),
                ),
                children: [
                  TextSpan(
                    text: 'Name, Date, Comment', // Smaller font text
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: UserData().selectedAccount.accountColor,
                        letterSpacing: 0,
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
