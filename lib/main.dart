import 'package:bud/app.dart';
import 'package:bud/services/isar_database.dart';
import 'package:bud/services/logger_service.dart';
import 'package:bud/viewmodels/transactions_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  final isarDatabase = IsarDatabase();
  final logger = LoggerService();

  isarDatabase.initialize();
  logger.initialize();

  runApp(Bud(isarDatabase: isarDatabase));
}

// entry point of app
// mainly DI setup for Providers and future BLoCs
class Bud extends StatelessWidget {
  final IsarDatabase isarDatabase;
  const Bud({super.key, required this.isarDatabase});

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


