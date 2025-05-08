import 'package:expenses_tracker_app_v2/components/balance_cards.dart';
import 'package:expenses_tracker_app_v2/components/expenses_tracking_box.dart';
import 'package:expenses_tracker_app_v2/components/latest_transaction.dart';
import 'package:expenses_tracker_app_v2/components/my_app_bar.dart';
import 'package:expenses_tracker_app_v2/components/quick_transaction_button.dart';
import 'package:expenses_tracker_app_v2/theme/Colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../components/my_text_field.dart';
import '../components/pay_receive_widget.dart';
import '../model/user_data.dart';
import 'all_transactions_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Listening to data changes.
    final userData = Provider.of<UserData>(context, listen: true);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          // Main screen.
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // User app bar.
                  const Padding(
                    padding:
                        EdgeInsets.only(left: 12.0, right: 12.0, top: 22.0),
                    child: MyAppBar(),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // The three cards
                  BalanceCards(
                    userData: userData,
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Latest transactions and See all text.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Latest Transaction',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AllTransactionsScreen(),
                              ), // Correct navigation
                            );
                          },
                          child: Text(
                            'See All',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: userData.selectedAccount.accountColor,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Latest transaction.
                  LatestTransaction(userData: userData),

                  // Last Expense/Income text.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Expense',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.red.shade400,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                            Text(
                              '/Income',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                  color: Colors.green.shade400,
                                  letterSpacing: -1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Tracking boxes.
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Last day.
                        GestureDetector(
                          onTap: () {
                            userData.toggleTrackingLastDayExpense();
                          },
                          child: ExpensesTrackingBox(
                            label: 'Day',
                            total: userData.trackingLastDayExpense
                                ? -32.95
                                : 51.50,
                            incomeBoxColor: userData.trackingLastDayExpense
                                ? SecondaryColors.secondarySkyBlue
                                : SecondaryColors.secondaryRed,
                            expenseBoxColor: userData.trackingLastDayExpense
                                ? SecondaryColors.secondaryRed
                                : SecondaryColors.secondarySkyBlue,
                          ),
                        ),
                        // Last week.
                        GestureDetector(
                          onTap: () {
                            userData.toggleTrackingLastWeekExpense();
                          },
                          child: ExpensesTrackingBox(
                            label: 'Week',
                            total: userData.trackingLastWeekExpense
                                ? -282.75
                                : 321.50,
                            incomeBoxColor: userData.trackingLastWeekExpense
                                ? SecondaryColors.secondaryTeal
                                : SecondaryColors.secondaryOrange,
                            expenseBoxColor: userData.trackingLastWeekExpense
                                ? SecondaryColors.secondaryOrange
                                : SecondaryColors.secondaryTeal,
                          ),
                        ),
                        // Last month.
                        GestureDetector(
                          onTap: () {
                            userData.toggleTrackingLastMonthExpense();
                          },
                          child: ExpensesTrackingBox(
                            label: 'Month',
                            total: userData.trackingLastMonthExpense
                                ? -622.15
                                : 1201.55,
                            incomeBoxColor: userData.trackingLastMonthExpense
                                ? SecondaryColors.secondaryGreen
                                : SecondaryColors.secondaryYellow,
                            expenseBoxColor: userData.trackingLastMonthExpense
                                ? SecondaryColors.secondaryYellow
                                : SecondaryColors.secondaryGreen,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  // Quick transactions text.
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quick Transactions',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              letterSpacing: -1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Quick transactions buttons.
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QuickTransactionButton(
                            text: 'Shopping',
                            onPressed: () {},
                            icon: HeroIcons.shopping_cart,
                            backgroundColor:
                                userData.selectedAccount.accountColor,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          QuickTransactionButton(
                            text: 'Sweet',
                            onPressed: () {},
                            icon: HeroIcons.cake,
                            backgroundColor:
                                userData.selectedAccount.accountColor,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          QuickTransactionButton(
                            text: 'Books',
                            onPressed: () {},
                            icon: HeroIcons.book_open,
                            backgroundColor:
                                userData.selectedAccount.accountColor,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),

          // Pay/Receive panel.
          PayReceiveWidget(userData: userData,),
        ],
      ),
    );
  }
}
