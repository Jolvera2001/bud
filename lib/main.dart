import 'package:bud/app.dart';
import 'package:bud/viewmodels/transactions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Bud());
}

// entry point of app
// mainly DI setup for Providers and future BLoCs
class Bud extends StatelessWidget {
  const Bud({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionsViewmodel())
      ],
      child: BudApp(),
    );
  }
}


