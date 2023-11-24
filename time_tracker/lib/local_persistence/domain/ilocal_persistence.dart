
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

abstract class ILocalPersistence {
  Future<List<CategoryData>> getLocalData();
  Future<void> storeLocalData({required List<CategoryData> data});
  Future<void> addLocalData({required CategoryData data});
  Future<void> updateLocalData({required CategoryData category, required int currentTimeSpent, required String title});
}
