abstract class SavingsState {}

class SavingsInitial extends SavingsState {}

class SavingsLoaded extends SavingsState {
  final double compA;
  final double compB;
  final List<String> history;

  SavingsLoaded(this.compA, this.compB, this.history);
}

class SavingsUpdated extends SavingsState {}

class SavingsError extends SavingsState {
  final String message;
  SavingsError(this.message);
}
