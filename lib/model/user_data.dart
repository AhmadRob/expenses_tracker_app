import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:expenses_tracker_app_v2/theme/Colors/app_colors.dart';
import 'account.dart';
import 'dart:collection';

class UserData with ChangeNotifier {
  // Singleton instance.
  static final UserData _instance = UserData._internal();

  // Factory constructor to return the singleton instance.
  factory UserData() {
    return _instance;
  }

  // Private internal constructor.
  UserData._internal() {
    _initializeData();
  }

  // Reference the User box.
  final _box = Hive.openBox('UserBox');

  late Image userPicture;

  late String _name;
  late String _userEmail;
  late String _userPassword;

  // Use a Queue to manage accounts.
  final Queue<Account> _accountsQueue = Queue();

  // Current selected account.
  late Account _selectedAccount;

  late List<StatelessWidget> _quickTransactionButtons;

  // Check if trackingExpense is true.
  bool _trackingLastDayExpense = true;

  bool _trackingLastWeekExpense = true;

  bool _trackingLastMonthExpense = true;

  // Check if data is initialized.
  bool _isInitialized = false;

  // Initialize data only once.
  void _initializeData() {
    if (_isInitialized) return; // Skip if already initialized.

    // Add accounts to the queue.
    _accountsQueue.addAll([
      Account(
        accountColor: PrimaryColors.primaryBlue,
        accountName: 'first',
        accountBalance: 3200.0,
        transactions: [],
      ),
      Account(
        accountColor: PrimaryColors.lightPurple,
        accountName: 'second',
        accountBalance: 1915.35,
        transactions: [],
      ),
      Account(
        accountColor: PrimaryColors.primaryGreen,
        accountName: 'third',
        accountBalance: 23000.0,
        transactions: [],
      ),
    ]);

    // Set the first account as the selected account
    _selectedAccount = _accountsQueue.first;

    _isInitialized = true; // Mark as initialized
  }

  // Getters and Setters
  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  String get userEmail => _userEmail;

  set userEmail(String value) {
    _userEmail = value;
    notifyListeners();
  }

  String get userPassword => _userPassword;

  set userPassword(String value) {
    _userPassword = value;
    notifyListeners();
  }

  Account get selectedAccount => _selectedAccount;

  set selectedAccount(Account value) {
    _selectedAccount = value;
    notifyListeners();
  }

  List<StatelessWidget> get quickTransactionButtons => _quickTransactionButtons;

  set quickTransactionButtons(List<StatelessWidget> value) {
    _quickTransactionButtons = value;
    notifyListeners();
  }

  Queue<Account> get accountsQueue => _accountsQueue;

  bool get trackingLastDayExpense => _trackingLastDayExpense;

  bool get trackingLastWeekExpense => _trackingLastWeekExpense;

  bool get trackingLastMonthExpense => _trackingLastMonthExpense;

  // Functions.

  // Toggle between accounts using the queue
  void toggleAccount() {
    // Remove the first account from the queue
    final removedAccount = _accountsQueue.removeFirst();

    // Add it back to the end of the queue
    _accountsQueue.addLast(removedAccount);

    // Update the selected account to the new first account in the queue
    _selectedAccount = _accountsQueue.first;

    if (kDebugMode) {
      print('Selected Account: ${_selectedAccount.accountName}');
    }
    notifyListeners();
  }

  void toggleTrackingLastDayExpense() {
    // Toggle tracking expense.
    _trackingLastDayExpense = !_trackingLastDayExpense;
    notifyListeners();
  }

  void toggleTrackingLastWeekExpense() {
    // Toggle tracking expense.
    _trackingLastWeekExpense = !_trackingLastWeekExpense;
    notifyListeners();
  }

  void toggleTrackingLastMonthExpense() {
    // Toggle tracking expense.
    _trackingLastMonthExpense = !_trackingLastMonthExpense;
    notifyListeners();
  }

  void deleteTransaction() {}

  void editTransaction() {}

  void restoreTransaction() {}
}
