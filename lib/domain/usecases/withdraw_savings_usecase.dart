import '../../data/repositories/savings_repository.dart';

class WithdrawSavingsUseCase {
  final SavingsRepository repository;
  WithdrawSavingsUseCase(this.repository);

  Future<void> call(double amount, String component) async {
    double currentBalance =
        await repository.hiveService.getData(component) ?? 0;
    double updatedBalance = currentBalance - amount;
    if (updatedBalance >= 0) {
      await repository.hiveService.saveData(component, updatedBalance);
    }
  }
}
