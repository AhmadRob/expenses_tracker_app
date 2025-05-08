import 'package:expenses_tracker_app_v2/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/user_data.dart';
import '../theme/Colors/app_colors.dart';

class BalanceCards extends StatelessWidget {
  final UserData userData;

  const BalanceCards({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        // Third card.
        Opacity(
          opacity: 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: userData.accountsQueue.last.accountColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: userData.accountsQueue.last.accountColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // Front card information.
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // JOD text.
                      Text(
                        'JOD',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // Balance.
                      Text(
                        userData.selectedAccount.accountBalance.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 42,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                            text: 'Pay',
                            fontSize: 14,
                            textColor: Colors.red.shade300,
                            backgroundColor: SecondaryColors.secondaryRed,
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical: 12,
                            ),
                          ),
                          MyButton(
                            text: userData.selectedAccount.accountName,
                            fontSize: 14,
                            backgroundColor: userData.selectedAccount.accountColor,
                            onPressed: () {
                              userData.toggleAccount();
                            },
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                          ),
                          MyButton(
                            text: 'Receive',
                            fontSize: 14,
                            textColor: Colors.green,
                            backgroundColor: SecondaryColors.secondaryLightGreen,
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Second card.
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: userData.accountsQueue.elementAt(1).accountColor,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: userData.accountsQueue.elementAt(1).accountColor,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                // Front card information.
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // JOD text.
                      Text(
                        'JOD',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      // Balance.
                      Text(
                        userData.selectedAccount.accountBalance.toString(),
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 42,
                            color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                            text: 'Pay',
                            fontSize: 14,
                            textColor: Colors.red.shade300,
                            backgroundColor: SecondaryColors.secondaryRed,
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical: 12,
                            ),
                          ),
                          MyButton(
                            text: userData.selectedAccount.accountName,
                            fontSize: 14,
                            backgroundColor: userData.selectedAccount.accountColor,
                            onPressed: () {
                              userData.toggleAccount();
                            },
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                          ),
                          MyButton(
                            text: 'Receive',
                            fontSize: 14,
                            textColor: Colors.green,
                            backgroundColor: SecondaryColors.secondaryLightGreen,
                            onPressed: () {},
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // First card (front card).
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
          ),
          decoration: BoxDecoration(
            color: userData.selectedAccount.accountColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              color: SecondaryColors.secondaryYellow,
              borderRadius: BorderRadius.circular(20.0),
            ),
            // Front card information.
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // JOD text.
                  Text(
                    'JOD',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Balance.
                  Text(
                    userData.selectedAccount.accountBalance.toString(),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 42,
                        color: Theme.of(context).colorScheme.inverseSurface,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        text: 'Pay',
                        fontSize: 14,
                        textColor: Colors.red.shade300,
                        backgroundColor: SecondaryColors.secondaryRed,
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                          horizontal: 36,
                          vertical: 12,
                        ),
                      ),
                      MyButton(
                        text: userData.selectedAccount.accountName,
                        fontSize: 14,
                        backgroundColor: userData.selectedAccount.accountColor,
                        onPressed: () {
                          userData.toggleAccount();
                        },
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                      ),
                      MyButton(
                        text: 'Receive',
                        fontSize: 14,
                        textColor: Colors.green,
                        backgroundColor: SecondaryColors.secondaryLightGreen,
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
