import 'package:flutter/cupertino.dart';

class TransactionData {
  int transactionAmount;
  DateTime transactionDate;
  String transactionAccount;
  String transactionCategory;
  String transactionComment;
  Icon transactionIcon;
  Color transactionColor;

  TransactionData({
    required this.transactionAmount,
    required this.transactionDate,
    required this.transactionAccount,
    required this.transactionCategory,
    required this.transactionComment,
    required this.transactionIcon,
    required this.transactionColor,
  });
}
