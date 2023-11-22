import 'package:hive_flutter/hive_flutter.dart';
import 'package:time_tracker/local_persistence/domain/ilocal_persistence.dart';
import 'package:time_tracker/time_tracker/data/models/time_tracker.dart';

import '../../../core/constants/hive_const.dart';

class LocalPersistence implements ILocalPersistence {

  final _catDataBox = Hive.box<CategoryData>(HiveConst.categoryDataBox);
  // Box<CategoryData> _catDataBox;
  @override
  Future<void> addLocalData({required CategoryData data}) async {
    await _catDataBox.add(data);
  }

  @override
  Future<List<CategoryData>> getLocalData() async {
    return  _catDataBox.values.toList();
  }

  @override
  Future<void> storeLocalData({required List<CategoryData> data}) async {
    await _catDataBox.clear();
    await _catDataBox.addAll(data);
  }
}
