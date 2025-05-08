import 'package:expenses_tracker_app_v2/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_text_field.dart';

class PayReceiveWidget extends StatelessWidget {
  final UserData userData;

  const PayReceiveWidget({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.0,
      maxChildSize: 0.75,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.surface,
                        ),
                        child: DropdownButton(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          menuWidth: 150,
                          menuMaxHeight: 250,
                          underline: Container(),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:
                              userData.selectedAccount.accountColor,
                              letterSpacing: 0,
                            ),
                          ),
                          value: userData.selectedAccount.accountName,
                          items: userData.accountsQueue.map((account) {
                            return DropdownMenuItem<String>(
                              value: account.accountName,
                              child: Center(
                                child: Text(
                                  account.accountName,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color:
                                      userData.selectedAccount.accountColor,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String) {},
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
    );
  }
}
