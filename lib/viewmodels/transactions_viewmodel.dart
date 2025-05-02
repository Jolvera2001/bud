import 'package:bud/models/recurring_transaction.dart';
import 'package:flutter/material.dart';

class TransactionsViewmodel extends ChangeNotifier {
  String _name = "";
  List<RecurringTransaction> _transactionList = [];

  String get name => _name;
  List<RecurringTransaction> get transactionList => _transactionList;

  void addTransaction(RecurringTransaction newItem) {
    _transactionList.add(newItem);
    notifyListeners();
  }

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }

}
