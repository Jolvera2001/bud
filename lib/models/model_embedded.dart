import 'package:isar/isar.dart';

part 'model_embedded.g.dart';

@embedded
class Description {
  String? notes;
  String? tags;
}

@embedded
class IncomeDetails {
  String? source;
  bool? isGuaranteed;
}

@embedded
class ExpenseDetails {
  String? payee;
  String? paymentMethod;
  bool? autoRenewable;
}