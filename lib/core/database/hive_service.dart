
import 'package:hive/hive.dart';

class HiveService {
  Future<void> saveData(String key, dynamic value) async {
    var box = await Hive.openBox('savingsBox');
    await box.put(key, value);
  }

  Future<dynamic> getData(String key) async {
    var box = await Hive.openBox('savingsBox');
    return box.get(key);
  }
}
