
import '../../data/repositories/savings_repository.dart';

class AddSavingsUseCase {
  final SavingsRepository repository;
  AddSavingsUseCase(this.repository);

  Future<void> call(double amount) async {
    await repository.addSavings(amount);
  }
}
