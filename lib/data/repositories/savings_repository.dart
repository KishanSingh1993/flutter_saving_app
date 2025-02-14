import '../models/savings_model.dart';
import '../../core/database/hive_service.dart';

class SavingsRepository {
  final HiveService hiveService;
  SavingsRepository(this.hiveService);

  Future<void> addSavings(double amount) async {
    double compA = amount / 2;
    double compB = amount / 2;
    await hiveService.saveData('compA', compA);
    await hiveService.saveData('compB', compB);
  }
}
