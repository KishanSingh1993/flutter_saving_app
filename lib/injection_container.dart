import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'core/database/hive_service.dart';
import 'data/repositories/savings_repository.dart';
import 'domain/usecases/add_savings_usecase.dart';
import 'domain/usecases/withdraw_savings_usecase.dart';
import 'presentation/bloc/savings_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final savingsBox = await Hive.openBox('savingsBox');
  sl.registerLazySingleton(() => savingsBox);

  sl.registerLazySingleton(() => HiveService());
  sl.registerLazySingleton(() => SavingsRepository(sl<HiveService>()));
  sl.registerLazySingleton(() => AddSavingsUseCase(sl<SavingsRepository>()));
  sl.registerLazySingleton(
      () => WithdrawSavingsUseCase(sl<SavingsRepository>()));
  sl.registerFactory(() => SavingsBloc(
      sl<AddSavingsUseCase>(), sl<WithdrawSavingsUseCase>(), sl<Box>()));
}

// import 'package:get_it/get_it.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'core/database/hive_service.dart';
// import 'data/repositories/savings_repository.dart';
// import 'domain/usecases/add_savings_usecase.dart';
// import 'domain/usecases/withdraw_savings_usecase.dart';
// import 'presentation/bloc/savings_bloc.dart';

// final sl = GetIt.instance;

// Future<void> init() async {
//   // Open Hive box inside init

//   sl.registerLazySingleton(() => HiveService());
//   sl.registerLazySingleton(() => SavingsRepository(sl<HiveService>()));
//   sl.registerLazySingleton(() => AddSavingsUseCase(sl<SavingsRepository>()));
//   await Hive.initFlutter();
//   final savingsBox = await Hive.openBox('savingsBox');
//   sl.registerLazySingleton(() => savingsBox);
//   sl.registerFactory(() => SavingsBloc(sl()));
// }

// // final sl = GetIt.instance;

// // Future<void> init() async {
// //   sl.registerLazySingleton(() => HiveService());
// //   sl.registerLazySingleton(() => SavingsRepository(sl()));
// //   sl.registerLazySingleton(() => AddSavingsUseCase(sl()));
// //   sl.registerLazySingleton(() => WithdrawSavingsUseCase(sl()));
// //   //sl.registerFactory(() => SavingsBloc(sl(), sl()));

// //   await Hive.initFlutter();
// //   final savingsBox = await Hive.openBox('savingsBox');
// //   sl.registerLazySingleton(() => savingsBox);
// //   sl.registerFactory(() => SavingsBloc(sl()));
// // }
