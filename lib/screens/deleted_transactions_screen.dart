import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/my_search_bar.dart';
import '../components/transaction_tile.dart';
import '../model/transaction_data.dart';
import '../model/user_data.dart';
import '../theme/Colors/app_colors.dart';

class DeletedTransactionsScreen extends StatefulWidget {
  final Function(BuildContext)? onDelete; // Callback for delete action.
  final Function(BuildContext)? onRestore; // Callback for edit action.

  const DeletedTransactionsScreen({
    super.key,
    this.onDelete,
    this.onRestore,
  });

  @override
  State<DeletedTransactionsScreen> createState() => _DeletedTransactionsScreenState();
}

class _DeletedTransactionsScreenState extends State<DeletedTransactionsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showGoUpButton = false;

  @override
  void initState() {
    super.initState();
    // Listen to scroll events.
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    // Dispose the scroll controller.
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Show the "Go Up" button if the user has scrolled down.
    if (_scrollController.offset > 100 && !_showGoUpButton) {
      setState(() {
        _showGoUpButton = true;
      });
    }
    // Hide the "Go Up" button if the user is at the top.
    else if (_scrollController.offset <= 100 && _showGoUpButton) {
      setState(() {
        _showGoUpButton = false;
      });
    }
  }

  void _scrollToTop() {
    // Scroll to the top of the list.
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          'Deleted Transactions',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: UserData().selectedAccount.accountColor,
              letterSpacing: -1,
            ),
          ),
        ),
        centerTitle: true,
        foregroundColor: UserData().selectedAccount.accountColor,
        surfaceTintColor: Theme.of(context).colorScheme.surface,
      ),
      body: CustomScrollView(
        controller: _scrollController, // Attach the scroll controller.
        slivers: [
          const SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 65,
            backgroundColor: Colors.transparent,
            elevation: 0,
            pinned: false,
            flexibleSpace: MySearchBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    const SizedBox(height: 15),
                    Text(
                      textAlign: TextAlign.start,
                      '${index + 1} day left',
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Slidable(
                      // Start action pane (left side).
                      startActionPane: ActionPane(
                        motion: const DrawerMotion(), // Swipe motion.
                        children: [
                          // Delete action
                          SlidableAction(
                            onPressed: const DeletedTransactionsScreen().onDelete,
                            // Callback for delete
                            backgroundColor: Colors.red.shade400,
                            icon: Icons.delete_forever_rounded,
                            label: 'Delete',
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                        ],
                      ),
                      // End action pane (right side).
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(), // Swipe motion.
                        children: [
                          // Edit action.
                          SlidableAction(
                            onPressed:
                                const DeletedTransactionsScreen().onRestore,
                            // Callback for edit.
                            backgroundColor: PrimaryColors.primaryBlue,
                            icon: Icons.restore_rounded,
                            label: 'Restore',
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                        ],
                      ),
                      child: TransactionTile(
                        userData: UserData(),
                        transaction: TransactionData(
                          transactionAmount: -100,
                          transactionAccount: 'first',
                          transactionCategory: 'Shopping',
                          transactionComment: 'New clothes',
                          transactionDate: DateTime.now()
                              .subtract(const Duration(days: 3)),
                          transactionColor: SecondaryColors.secondaryYellow,
                          transactionIcon: const Icon(Icons.shopping_bag),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      // "Go Up" button
      floatingActionButton: _showGoUpButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: UserData().selectedAccount.accountColor,
              child: const Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
