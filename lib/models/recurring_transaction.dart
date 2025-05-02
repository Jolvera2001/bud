import 'package:bud/models/model_embedded.dart';
import 'package:bud/models/model_enums.dart';
import 'package:isar/isar.dart';

part 'recurring_transaction.g.dart';

@collection
class RecurringTransaction {
  Id id = Isar.autoIncrement;
  DateTime? createdAt;
  DateTime? updatedAt;
  
  @Index()
  String? name;
  @Index()
  double? amount;
  @enumerated
  late TransactionPattern pattern;

  @enumerated
  late TransactionType type;

  // options open based on type
  IncomeDetails? incomeDetails;
  ExpenseDetails? expenseDetails;

  // entirely optional
  Description? description;
}

