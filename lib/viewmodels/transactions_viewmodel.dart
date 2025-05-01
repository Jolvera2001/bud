import 'package:flutter/material.dart';

class TransactionsViewmodel extends ChangeNotifier {
  String _name = "";

  String get name => _name;
  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
