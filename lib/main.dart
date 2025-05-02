import 'package:bud/app.dart';
import 'package:bud/viewmodels/transactions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BudApp());
}

class SomeModel {

}

class BudApp extends StatelessWidget {
  const BudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionsViewmodel())
      ],
      child: MainApp(),
    );
  }
}


