import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'savings_event.dart';
import 'savings_state.dart';
import '../../domain/usecases/add_savings_usecase.dart';
import '../../domain/usecases/withdraw_savings_usecase.dart';

class SavingsBloc extends Bloc<SavingsEvent, SavingsState> {
  final AddSavingsUseCase addSavingsUseCase;
  final WithdrawSavingsUseCase withdrawSavingsUseCase;
  final Box savingsBox;

  double compA = 0.0;
  double compB = 0.0;
  List<String> history = [];

  SavingsBloc(
      this.addSavingsUseCase, this.withdrawSavingsUseCase, this.savingsBox)
      : super(SavingsInitial()) {
    // Load saved data from Hive when bloc is initialized
    _loadSavingsData();

    on<AddSavingsEvent>((event, emit) async {
      compA += event.amount / 2;
      compB += event.amount / 2;
      history.add(
          "Added ${event.amount} (CompA: ${event.amount / 2}, CompB: ${event.amount / 2})");

      // Save updated data to Hive
      _saveData();
      emit(SavingsLoaded(compA, compB, history));
    });

    // Handle withdrawing savings
    on<WithdrawSavingsEvent>((event, emit) async {
      if (event.component == "CompA" && event.amount > compA) {
        emit(SavingsError("Insufficient Balance in CompA!"));
      } else if (event.component == "CompB" && event.amount > compB) {
        emit(SavingsError("Insufficient Balance in CompB!"));
      } else {
        if (event.component == "CompA") {
          compA -= event.amount;
        } else {
          compB -= event.amount;
        }
        history.add("Withdrew ${event.amount} from ${event.component}");
        _saveData();
        emit(SavingsLoaded(compA, compB, history));
      }
    });
  }

  // Load data from Hive on startup
  void _loadSavingsData() {
    compA = savingsBox.get('compA', defaultValue: 0.0);
    compB = savingsBox.get('compB', defaultValue: 0.0);
    history = List<String>.from(savingsBox.get('history', defaultValue: []));

    emit(SavingsLoaded(compA, compB, history));
  }

  // Save data to Hive
  void _saveData() {
    savingsBox.put('compA', compA);
    savingsBox.put('compB', compB);
    savingsBox.put('history', history);
  }
}
