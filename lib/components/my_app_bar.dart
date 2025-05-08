import 'package:expenses_tracker_app_v2/screens/deleted_transactions_screen.dart';
import 'package:expenses_tracker_app_v2/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../model/user_data.dart';
import 'my_circle_avatar.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Listening to data changes.
    final userData = Provider.of<UserData>(context, listen: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture.
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ), // Correct navigation
                );
              },
              child: const MyCircleAvatar(
                size: 35,
                radius: 35,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            // Today date and user name.
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date of today.
                Text(
                  '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}\n${DateFormat('E').format(DateTime.now())}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                // User name.
                Text(
                  'Hi, UserName',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // Deleted transactions.
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DeletedTransactionsScreen(),
              ), // Correct navigation
            );
          },
          icon: Icon(
            HeroIcons.trash,
            color: userData.selectedAccount.accountColor,
            size: 35,
          ),
        ),
      ],
    );
  }
}
