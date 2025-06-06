import 'package:bud/models/recurring_transaction.dart';
import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';

class IsarDatabase {
  late Isar _isar;

  Isar get isar => _isar; 

  Future<void> initialize() async {
    final dir = await getApplicationSupportDirectory();
    _isar = await Isar.open(
      [RecurringTransactionSchema],
      directory: dir.path,
    );
  }

  Future<void> close() async {
    await _isar.close();
  }
}