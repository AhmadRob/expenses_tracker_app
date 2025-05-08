import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:expenses_tracker_app_v2/model/user_data.dart';
import 'package:expenses_tracker_app_v2/model/transaction_data.dart';

class TransactionTile extends StatelessWidget {
  final UserData userData;
  final TransactionData transaction;
  final Function(BuildContext)? onDelete; // Callback for delete action
  final Function(BuildContext)? onEdit; // Callback for edit action

  const TransactionTile({
    super.key,
    required this.userData,
    required this.transaction,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    // The actual tile content
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        color: transaction.transactionColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Transaction icon.
            Icon(
              Icons.fastfood_rounded,
              size: 45,
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Food',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      '-4.5',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Comments........',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
