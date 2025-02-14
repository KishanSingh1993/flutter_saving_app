abstract class SavingsEvent {}

class AddSavingsEvent extends SavingsEvent {
  final double amount;
  AddSavingsEvent(this.amount);
}

class WithdrawSavingsEvent extends SavingsEvent {
  final double amount;
  final String component;
  WithdrawSavingsEvent(this.amount, this.component);
}


