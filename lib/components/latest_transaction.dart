import 'package:expenses_tracker_app_v2/components/transaction_tile.dart';
import 'package:expenses_tracker_app_v2/model/transaction_data.dart';
import 'package:expenses_tracker_app_v2/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../theme/Colors/app_colors.dart';

class LatestTransaction extends StatelessWidget {
  final UserData userData;
  final Function(BuildContext)? onDelete; // Callback for delete action.
  final Function(BuildContext)? onEdit; // Callback for edit action.

  const LatestTransaction({
    super.key,
    required this.userData,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return // Latest transaction.
        Stack(
      alignment: Alignment.topCenter,
      children: [
        // Third card.
        Opacity(
          opacity: 0.4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: TransactionTile(
              userData: userData,
              transaction: TransactionData(
                transactionAmount: -100,
                transactionAccount: 'first',
                transactionCategory: 'Shopping',
                transactionComment: 'New clothes',
                transactionDate:
                    DateTime.now().subtract(const Duration(days: 3)),
                transactionColor: SecondaryColors.secondaryYellow,
                transactionIcon: const Icon(Icons.shopping_bag),
              ),
            ),
          ),
        ),
        // Second card.
        Opacity(
          opacity: 0.7,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TransactionTile(
              userData: userData,
              transaction: TransactionData(
                transactionAmount: -100,
                transactionAccount: 'first',
                transactionCategory: 'Shopping',
                transactionComment: 'New clothes',
                transactionDate:
                    DateTime.now().subtract(const Duration(days: 3)),
                transactionColor: SecondaryColors.secondaryRed,
                transactionIcon: const Icon(Icons.shopping_bag),
              ),
            ),
          ),
        ),
        // First card (front card).
        Slidable(
          // Start action pane (left side).
          startActionPane: ActionPane(
            motion: const DrawerMotion(), // Swipe motion
            children: [
              // Delete action
              SlidableAction(
                onPressed: onDelete,
                // Callback for delete
                backgroundColor: Colors.red.shade400,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
            ],
          ),
          // End action pane (right side).
          endActionPane: ActionPane(
            motion: const DrawerMotion(), // Swipe motion
            children: [
              // Edit action
              SlidableAction(
                onPressed: onEdit,
                // Callback for edit
                backgroundColor: PrimaryColors.lightPurple,
                icon: Icons.edit,
                label: 'Edit',
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
            ],
          ),
          child: TransactionTile(
            userData: userData,
            transaction: TransactionData(
              transactionAmount: -100,
              transactionAccount: 'first',
              transactionCategory: 'Shopping',
              transactionComment: 'New clothes',
              transactionDate: DateTime.now().subtract(const Duration(days: 3)),
              transactionColor: SecondaryColors.secondaryLightGreen,
              transactionIcon: const Icon(Icons.shopping_bag),
            ),
          ),
        ),
      ],
    );
  }
}
