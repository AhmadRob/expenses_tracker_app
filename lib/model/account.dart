import 'dart:ui';
import 'package:expenses_tracker_app_v2/model/transaction_data.dart';

class Account {
  String accountName;
  double accountBalance;
  List<TransactionData> transactions;
  Color accountColor;

  Account({
    required this.accountName,
    required this.accountBalance,
    required this.transactions,
    required this.accountColor,
  });
}
