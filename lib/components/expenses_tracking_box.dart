import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpensesTrackingBox extends StatelessWidget {
  final String label;
  final double total;
  final Color incomeBoxColor;
  final Color expenseBoxColor;

  const ExpensesTrackingBox({
    super.key,
    required this.label,
    required this.total,
    required this.incomeBoxColor,
    required this.expenseBoxColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: incomeBoxColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 35, top: 10),
            child: Column(
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  total < 0
                  ? total.toString()
                  : '+${total.toString()}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 12.0,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          decoration: BoxDecoration(
            color: expenseBoxColor,
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20.0, bottom: 30, top: 10),
            child: Column(
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  total < 0
                      ? total.toString()
                      : '+${total.toString()}',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                      color: Theme.of(context).colorScheme.inverseSurface,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
